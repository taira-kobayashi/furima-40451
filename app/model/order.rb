class Order < ApplicationRecord
  belongs_to :item
  belomgs_to :user
  has_one :shippingaddresses


end
