FactoryBot.define do

  factory :item do
    association :user
    item_name             {'testitem'}
    expanation             {'テストアイテム'}
    price                 {'1500'}
    category_id           {'2'}
    situation_id          {'2'}
    delivery_id           {'2'}
    region_id             {'2'}
    shippingdate_id       {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-footer.png'), filename: 'furima-footer.png')
    end
  end
end

