require 'rails_helper'

RSpec.describe Shippingaddress, type: :model do







    it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end
