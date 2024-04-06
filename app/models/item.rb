class Item < ApplicationRecord
  belongs_to :user
#  has_one :order
  has_one_attached :image

  validates :item_name, presence:true
  validates :expanation, presence:true
  validates :image, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_id, presence: true
  validates :region_id, presence: true
  validates :shippingdate_id, presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :region
  belongs_to :shippingdate
  validates :category_id,:situation_id,:delivery_id,:region_id,:shippingdate_id,
  numericality: { other_than: 1 , message: "can't be blank"}
  
end
