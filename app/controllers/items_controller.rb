class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create
  end
end

private

def item_params
  params.require(:item).permit(:content, :image).marge(user_id: current_user.id)
