class OrderController < ApplicationController
  before_action :set_item, only: [:index]

  def index
  end
end



private

def set_item
  @item = Item.find(params[:id])
end