FactoryBot.define do
  factory :order_shippingaddress do
    postcode { "123-4567"}
    municipalities { "テスト市" }
    streetaddress { "１－１"}
    buildingname { "テストビル"}
    tel { "09012345678" }
    token { "tok_abcdefghijk00000000000000000"}
    region_id             {'2'}

  end
end
