class ItemsController < ApplicationController
  def index
  end


  def new
    @item = Item.new
#    @articles = Article.order("created_at DESC")
  end

#  def create
#    @user = User.new(user_params)
#  end


private

  def message_params
    params.require(:item).permit(:image, :item_name, :expanation, :category_id, :situation_id, :delivery_id, :region_id, :shippingdate_id, :price,) .merge(user_id: current_user.id)
  end

end
