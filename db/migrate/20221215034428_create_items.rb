class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.string :image, null: false
      t.boolean :sale_status, null:false
      t.timestamps
    end
  end
end
