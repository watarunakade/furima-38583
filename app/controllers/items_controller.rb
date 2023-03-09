class ItemsController < ApplicationController
  def index
  end
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def item_params
  params.permit(:image, :item_name, :item_text, :category_id, :condition_id, :postage_id, :area_id, :sendday_id, :price ).merge(user_id: current_user.id)
end
