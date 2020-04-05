class Good < ApplicationRecord
#コメントアウト部は後に使用
 # has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
  has_many :saling_goods, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name:  "Good", dependent: :destroy
  has_many :sold_goods, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Good", dependent: :destroy
  has_many :good_images, dependent: :destroy
  # has_many :comments, through: :users_comments, dependent: :destroy
 # has_many :users_comments, dependent: :destroy
 # has_many :cards, dependent: :destroy
 # has_many :orders
  belongs_to :user_address
  belongs_to :category

VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :name, presence: true
  validates :price, presence: true, format:{ with: VALID_PRICE_REGEX }
end
