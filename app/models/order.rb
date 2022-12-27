class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy #order_itemになってました

  #enum payment_method ["クレジットカード", "銀行振込"] #0=クレカ、1=銀行振り込み
  enum pay_method: { credit_card: 0, transfer: 1 }

  enum order_status: {
     "入金待ち": 0,
     "入金確認": 1,
     "製作中": 2,
     "発送準備中": 3,
     "発送済み": 4
  }


end
