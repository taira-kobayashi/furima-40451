class ItemsController < ApplicationController
  def index
  end


  def new
    @articles = Article.order("created_at DESC")
  end

#  def create
#    @user = User.new(user_params)
#  end


end
