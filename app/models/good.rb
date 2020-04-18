class Good < ApplicationRecord
#コメントアウト部は後に使用
 # has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
  # has_many :comments, through: :users_comments, dependent: :destroy
 # has_many :users_comments, dependent: :destroy

  has_many :orders
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  # belongs_to :user_address
  has_one :category
  
  has_many :good_images, dependent: :destroy
  accepts_nested_attributes_for :good_images, allow_destroy: true


  VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, format:{ with: VALID_PRICE_REGEX }, inclusion: 300..9999999
  validates :state,                 presence: true
  validates :region,                presence: true
  validates :postage,               presence: true
  validates :expanation,            presence: true, length: { maximum: 1000 }
  validates :shipping_date,         presence: true
  validates :delivery_method_id,    presence: true
  validates :category_id,           presence: true
  validates :seller_id,             presence: true 
  validates :good_images,           presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :trading_conditions

end
