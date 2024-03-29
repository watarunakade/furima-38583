class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.purchase.present? || @item.user == current_user
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new(@item_id)
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :area_id, :address_street, :address_number, :building, :phone_number).merge( user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find (params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price, #商品の値段
        card: purchase_params[:token], #カードトークン
        currency: 'jpy' #通貨の種類(日本円)
      )
  end
end
