require 'rails_helper'

RSpec.describe OrderShippingaddress, type: :model do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @test = FactoryBot.build(:order_shippingaddress, user_id: user.id, item_id: item.id, region_id: item.region.id)
    end

  describe '商品購入機能' do
    context '正常系テスト' do
      it 'ログイン状態で情報を入力してあると購入できる' do
        expect(@test).to be_valid
      end

      it "建物名が空でも登録できる" do
        @test.buildingname = ""
        expect(@test).to be_valid
      end
    end

    context '異常系テスト' do
      it "郵便番号が空では登録できない" do
        @test.postcode = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("Postcode can't be blank")
      end

      it "郵便番号が不正の数値では登録できない" do
        @test.postcode = "1234567"
        @test.valid?
        expect(@test.errors.full_messages).to include("Postcode is invalid")
      end

      it "都道府県が空では登録できない" do
        @test.region_id = "1"
        @test.valid?
        expect(@test.errors.full_messages).to include("Region can't be blank")
      end

      it "市区町村が空では登録できない" do
        @test.municipalities = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("Municipalities can't be blank")
      end

      it "番地が空では登録できない" do
        @test.streetaddress = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("Streetaddress can't be blank")
      end

      it "電話番号が空では登録できない" do
        @test.tel = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("Tel can't be blank")
      end

      it "電話番号が9桁以下では登録できない" do
        @test.tel = "123456789"
        @test.valid?
        expect(@test.errors.full_messages).to include("Tel is too short (minimum is 10 characters)")
      end

      it "電話番号が12桁以上では登録できない" do
        @test.tel = "123456789012"
        @test.valid?
        expect(@test.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end

      it "電話番号の情報が不正の場合は登録できない" do
        @test.tel = "123-4567-8901"
        @test.valid?
        expect(@test.errors.full_messages).to include("Tel is invalid")
      end

      it "tokenが空では登録できない" do
        @test.token = nil
        @test.valid?
        expect(@test.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できない" do
        @test.user_id = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できない" do
        @test.item_id = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
