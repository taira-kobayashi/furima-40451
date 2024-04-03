require 'rails_helper'



RSpec.describe Item, type: :model do
  before do
    @user = create(:user)
    @outuser = create(:logged_out_user)
  end


  describe '商品出品関連機能' do
    context '内容に問題ない場合' do
      it '説明をいれる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '説明をいれる' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end


end




