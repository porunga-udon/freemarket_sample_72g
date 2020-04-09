class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.references :user,         foreign_key: true
      t.string :last_name,           null: false, default: ""
      t.string :first_name,          null: false, default: ""
      t.string :last_name_kana,      null: false
      t.string :first_name,          null: false
      t.string :last_name_kana,      null: false
      t.string :first_name_kana,     null: false
      t.string :postcode,            null: false
      t.string :prefecture,          null: false
      t.string :city,                null: false
      t.string :block,               null: false
      t.timestamps
    end
  end
end
