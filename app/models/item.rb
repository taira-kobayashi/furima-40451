class Item < ApplicationRecord
#  belongs_to :user
#  has_one :order
  has_one_attached :image

  validates :item_name, presence:true
  validates :expanation, presence:true
  validates :category_id, presence:true
  validates :situation_id, presence:true
  validates :delivery_id, presence:true
  validates :region_id, presence:true
  validates :shippingdate_id, presence:true
  validates :price, presence:true



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :region
  belongs_to :shippingdate

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end
