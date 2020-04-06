class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name               
      t.string :state              
      t.string :region            
      t.string :expanation       
      t.string :shipping_date     
      t.string :delivery_method 
      t.string :conditions 
      t.integer :price            
      t.integer :category_id,        foreign_key: true
      t.integer :buyer_id,                      foreign_key: true
      t.integer :saler_id,          foreign_key: true
      t.integer :size_id,           foreign_key: true
      t.integer :user_id,          foreign_key: true
      t.timestamps
    end
  end
end
