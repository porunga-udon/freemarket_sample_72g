class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postcode, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :block	, :string, null: false
  end
end
