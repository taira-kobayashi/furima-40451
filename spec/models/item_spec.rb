require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品関連機能' do
    context '正常系テスト' do
      it 'ログイン状態で情報を入力してあると出品できる' do
        expect(@item).to be_valid
      end

      it '出品価格が300円であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it '出品価格が9,999,999円であれば出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end

      it '出品価格が301円から9,999,998円の間であれば出品できる' do
        @item.price = Faker::Number.between(from: 301, to: 9999998)
        expect(@item).to be_valid
      end






    end

    context '異常系テスト' do
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it '画像データが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では登録できない' do
        @item.item_name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品の説明が空では登録できない' do
        @item.expanation = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Expanation can't be blank"
      end

      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が選択されていないと登録できない' do
        @item.situation_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Situation can't be blank"
      end

      it '配送料負担情報が選択されていないと登録できない' do
        @item.delivery_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
 
      it '発送元の地域が選択されていないと登録できない' do
        @item.region_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end

      it '発送までの日数が選択されていないと登録できない' do
        @item.shippingdate_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Shippingdate can't be blank"
      end

      it '料金が入力されていないと登録できない' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '料金が299円未満だと登録できない' do
        @item.price = '299' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '料金が10,000,000円以上だと登録できない' do
        @item.price = '10000000' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it '出品価格が全角数字だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '出品価格が全角文字だと出品できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number" 
      end
    end
  end
end


