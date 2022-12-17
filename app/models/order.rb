class Order < ApplicationRecorhas
  has_many :order_items
  has_many :itmes through :order_items
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
