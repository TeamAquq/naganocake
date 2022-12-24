class Order < ApplicationRecorhas
  belongs_to :customer
  has_many :order_item, dependent: :destroy
  
  validates :customer_id, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  enum payment_method: ["クレジットカード", "銀行振込"]
  
  enum status: {
     "入金待ち":0, 
     "入金確認":1, 
     "製作中":2, 
     "発送準備中":3, 
     "発送済み":4
  }
  
end
