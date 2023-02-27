class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item.params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def item_params
  params.require(:item).permit(:content, :image).marge(user_id: current_user.id)
end
