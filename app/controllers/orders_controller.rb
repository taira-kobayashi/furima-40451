class OrdersController < ApplicationController
  before_action :set_item, only: [:index]
  before_action :authenticate_user!, only:[:index]


  def index

  end

  def new
    @Order_shippingaddress = Order.new
  end


  def create
    @Order_shippingaddress = Order.new(order_params)
    if @Order_shippingaddress.valid?
      @Order_shippingaddress.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end







private

def set_item
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order).permit(:postcode, :region_id, :municipalities, :streetaddress, :uildingname, :tel).merge(user_id: current_user.id)
end

end