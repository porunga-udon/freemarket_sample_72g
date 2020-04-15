class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 以下のコメントアウトは実装するタイミングで随時コメントアウトを外す
  
  # has_many :comments, through: :users_comments, dependent: :destroy
  # has_many :users_comments, dependent: :destroy
  # has_many :cards, dependent: :destroy
  # has_many :orders

  has_many :buyed_goods, foreign_key: "buyer_id", class_name: "Good", dependent: :destroy
  has_many :selling_goods, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Good", dependent: :destroy
  has_many :sold_goods, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Good", dependent: :destroy
  has_many :user_addresses

  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  VALID_NUMBER_REGEX = /\A[0-9]+\z/

  validates_confirmation_of :password  
  attr_accessor :password_confirmation

  validates :nickname,           uniqueness: true
  validates :email,              allow_blank: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,           allow_blank: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 7 }
  validates :last_name,          allow_blank: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,         allow_blank: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,     allow_blank: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,    allow_blank: true, format: { with: VALID_KANA_REGEX }
  validates :phone_number,       allow_blank: true, format: { with: VALID_NUMBER_REGEX }
  
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_year
    validates :birth_month
    validates :birth_day
    validates :postcode
    validates :prefecture
    validates :city
    validates :block
  end

  mount_uploader :image, ImageUploader

end
