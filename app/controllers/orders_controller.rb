class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only:[:index ]
  before_action :buy_check, only:[:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shippingaddress = OrderShippingaddress.new
  end

  def create
    @order_shippingaddress = OrderShippingaddress.new(order_params)
    @order_shippingaddress.item_id = @item.id
    if @order_shippingaddress.valid?
      pay_item
      @order_shippingaddress.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end





private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shippingaddress).permit(:postcode, :region_id, :municipalities, :streetaddress, :buildingname, :tel).merge(user_id: current_user.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: set_item[:price], 
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def buy_check
    if  Order.exists?(item_id: params[:item_id])
      redirect_to root_path
    elsif  current_user == @item.user
    redirect_to root_path
    end
  end


end