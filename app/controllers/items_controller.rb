class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if  current_user != @item.user
      redirect_to items_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if  current_user == @item.user
      @item.destroy
      redirect_to root_path
    elsif
      redirect_to items_path
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :item_name, :expanation, :category_id, :situation_id, :delivery_id, :region_id, :shippingdate_id, :price,) .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
