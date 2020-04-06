# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|image|string|
|phone_number|string|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|

### Association
- has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
- has_many :saling_goods, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name:  "Good", dependent: :destroy
- has_many :sold_goods, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Good", dependent: :destroy
- has_many :comments, through: :users_comments, dependent: :destroy
- has_many :users_comments, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :orders
- has_many :user_address

## user_addressテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|

### Association
- has_many   :orders
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|


### Association
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|
|good_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- has_many :users, through: :users_comments
- has_many :users_comments
- belongs_to :good

## users_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|good_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :comment
- belongs_to :user

## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|state|string|null: false|
|postage|string|null: false|
|region|string|null: false|
|delivery_method|string|null: false|
|shipping_date|string|null: false|
|expanation|string|null: false|
|conditions|string|null: false|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :category
- belongs_to :size
- has_many :comments, dependent: :destroy
- has_many :good_images, dependent: :destroy
- has_many :orders

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|good_id|integer|null: false, foreign_key: true|
|user_address_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :user_address
- belongs_to :good

## good_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|

### Association
- belongs_to :good

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :goods
- has_many :sizes, through: :categories_sizes
- has_many :categories_sizes

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :goods
- has_many :categories, through: :categories_sizes
- has_many :categories_sizes

## catedories_sizesテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size
