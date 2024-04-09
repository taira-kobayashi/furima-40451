class OrderShippingaddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :city, :postcode, :region_id, :municipalities, :streetaddress, :buildingname, :tel, :order, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipalities
    validates :streetaddress
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :tel, numericality: { only_integer: true }, format: { with: /\A[0-9]+\z/ }, length: { minimum: 10, maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    shippingaddresses = Shippingaddress.create(postcode: postcode, region_id: region_id, municipalities: municipalities, streetaddress: streetaddress, buildingname: buildingname, tel: tel, order_id: order.id)
  end

end
