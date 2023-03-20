class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def edit
    if user_signed_in?
      if !(current_user == @item.user)
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :condition_id, :postage_id, :area_id, :sendday_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
