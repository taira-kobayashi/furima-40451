class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only:[:index ]


  def index
    @order_shippingaddress = OrderShippingaddress.new
  end

  def create
    @order_shippingaddress = OrderShippingaddress.new(order_params)
    @order_shippingaddress.item_id = @item.id
    if @order_shippingaddress.valid?
      @order_shippingaddress.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end







private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shippingaddress).permit(:postcode, :region_id, :municipalities, :streetaddress, :buildingname, :tel).merge(user_id: current_user.id)
  end

end