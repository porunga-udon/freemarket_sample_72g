class Good < ApplicationRecord
#コメントアウト部は後に使用
 # has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
  # has_many :comments, through: :users_comments, dependent: :destroy
 # has_many :users_comments, dependent: :destroy

  has_many :orders
  belongs_to :seller, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  # belongs_to :user_address
  belongs_to :category
  
  has_many :good_images, dependent: :destroy
  accepts_nested_attributes_for :good_images, allow_destroy: true


  VALID_PRICE_REGEX = /\A[0-9]+\z/

  validates :name, presence: true
  validates :state, presence: true
  validates :region, presence: true
  validates :postage, presence: true
  validates :expanation, presence: true
  validates :shipping_date, presence: true
  validates :delivery_method_id, presence: true
  validates :trading_conditions, presence: true
  validates :price, presence: true, format:{ with: VALID_PRICE_REGEX }
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :buyer, presence: true
  validates :seller, presence: true



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery_method

end
