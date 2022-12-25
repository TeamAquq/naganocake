class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :quanity, null: false　#quantityです
      t.integer :tax_price, null: false
      t.integer :creat_status, null: false #本来、create_statusです

      t.timestamps
    end
  end
end
