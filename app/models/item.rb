class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_items
  has_many :order_items
  
  has_one_attached :image
  validates :genre_id, :name, :price, presence: true
	validates :body, length: { maximum: 200 }, presence: true
	validates :price, numericality: { only_integer: true }

def add_tax_price
  (self.price * 1.10).round
end
end