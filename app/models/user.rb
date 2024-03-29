class User < ApplicationRecord
  has_many :items
  has_many :orders

  validates :name, presence:true
  validates :email, presence:true
  validates :encrypted_password, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :first_name_kana, presence:true
  validates :last_name_kana, presence:true
  validates :birth, presence:true
   
end
