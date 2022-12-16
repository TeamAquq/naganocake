class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :orders
  
  has_one_attached :image
end
