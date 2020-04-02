class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
  # has_many :saling_goods, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Good", dependent: :destroy
  # has_many :sold_goods, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Good", dependent: :destroy
  # has_many :comments, through: :users_comments, dependent: :destroy
  # has_many :users_comments, dependent: :destroy
  # has_many :cards, dependent: :destroy
  # has_many :orders
  has_many :user_addresses

  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  VALID_NUMBER_REGEX = /\A[0-9]+\z/

  validates_confirmation_of :password  
  attr_accessor :password_confirmation

  validates :nickname,           presence: true, uniqueness: true
  validates :email,              presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 7 }
  validates :last_name,          presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,     presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,    presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_year,         presence: true
  validates :birth_month,        presence: true
  validates :birth_day,          presence: true
  validates :phone_number,       format: { with: VALID_NUMBER_REGEX }
  validates :postcode,           presence: true
  validates :prefecture,         presence: true
  validates :city,               presence: true
  validates :block,              presence: true
end
