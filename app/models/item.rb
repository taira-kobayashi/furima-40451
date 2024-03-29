class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  validates :item_name, presence:true
  validates :expanation, presence:true
  validates :category_id, presence:true
  validates :situation_id, presence:true
  validates :delivery_id, presence:true
  validates :region_id, presence:true
  validates :shippingdate_id, presence:true
  validates :price, presence:true
end
