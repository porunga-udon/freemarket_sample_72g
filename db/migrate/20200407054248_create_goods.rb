class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name,               null:false
      t.string :state,              null:false
      t.string :region,             null:false
      t.string :postage,            null:false
      t.string :expanation,         null:false
      t.string :shipping_date,      null:false
      t.integer :delivery_method_id           , foreign_key: true
      t.string :trading_conditions, null:false, default: "未発送"
      t.integer :price,             null:false
      t.bigint :category_id,        null:false, foreign_key: true
      t.integer :size_id,           foreign_key: true
      t.references :buyer,          foreign_key: { to_table: :users }
      t.references :seller,         foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
