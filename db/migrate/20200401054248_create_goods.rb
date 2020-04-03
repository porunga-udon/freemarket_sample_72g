class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name,               null:false
      t.string :state,              null:false
      t.string :region,             null:false
      t.string :postage,            null:false
      t.string :expanation,         null:false
      t.string :shipping_date,      null:false
      t.string :delivery_method,    null:false
      t.string :frading_conditions, null:false
      t.integer :price,             null:false
      t.integer :category_id,       null:false, foreign_key: true
      t.integer :buyer_id,          null:false, foreign_key: true
      t.integer :saler_id,          null:false, foreign_key: true
      t.integer :size_id,           null:false, foreign_key: true
      t.integer :user_id,           null:false, foreign_key: true
      t.timestamps
    end
  end
end
