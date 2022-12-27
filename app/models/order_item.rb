class OrderItem < ApplicationRecord
  #ApplicationRecorhasになってました
  belongs_to :order #belongs_to :ordrerになってました
  belongs_to :item

enum creat_status: { #本来、create_statusです
  "着手不可":0,
  "制作待ち":1,
  "製作中":2,
  "制作完了":3,
}

end