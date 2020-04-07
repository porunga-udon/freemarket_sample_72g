class Good < ApplicationRecord
#コメントアウト部は後に使用
 # has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
  # has_many :comments, through: :users_comments, dependent: :destroy
 # has_many :users_comments, dependent: :destroy
 # has_many :cards, dependent: :destroy
 # has_many :orders
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :user_address
  belongs_to :category
  has_many :good_images, dependent: :destroy

  accepts_nested_attributes_for :good_images, allow_destroy: true


  VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :name, presence: true
  validates :price, presence: true, format:{ with: VALID_PRICE_REGEX }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
end
