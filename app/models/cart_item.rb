class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :customer_id, :item_id, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  
   def subtotal
    item.add_tax_price*quantity
   end
end
