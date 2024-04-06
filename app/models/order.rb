class Order < ApplicationRecord
  belongs_to :item
  belomgs_to :user
end
