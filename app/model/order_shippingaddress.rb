class Order_shippingaddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :city, :postcode, :region_id, :municipalities, :streetaddress, :buildingname, :tel, :order


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipalities
    validates :streetaddress
    validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :tel, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
  end

  def create
    @order = Order.create(order_params)
    Shippingaddresses.create(shippingaddresses_params)
    redirect_to root_path
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shippingaddress.create(postcode: postcode, municipalities: municipalities, streetaddress: streetaddress, region_id: region_id, tel: tel)
  end

end
