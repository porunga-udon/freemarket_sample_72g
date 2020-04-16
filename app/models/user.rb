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

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,30}\z/i
  VALID_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_POSTCODE_REGEX = /\A\d{7}\z/

  validates_confirmation_of :password  
  attr_accessor :password_confirmation

  validates :nickname,              uniqueness: true, length: { maximum: 10 }
  validates :email,                 allow_blank: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,              allow_blank: true, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含んで設定してください' }, length: { in: 7..30 }
  validates :password_confirmation, presence: true
  validates :last_name,             length: { maximum: 20 }
  validates :first_name,            length: { maximum: 20 }
  validates :last_name_kana,        allow_blank: true, format: { with: VALID_KANA_REGEX, message: 'はカタカナで入力して下さい' }, length: { maximum: 20 }
  validates :first_name_kana,       allow_blank: true, format: { with: VALID_KANA_REGEX, message: 'はカタカナで入力して下さい' }, length: { maximum: 20 }
  validates :postcode,              allow_blank: true, format: { with: VALID_POSTCODE_REGEX}, length: { maximum: 7 }
  validates :prefecture,            length: { maximum: 20 }
  validates :city,                  length: { maximum: 20 }
  validates :block,                 length: { maximum: 20 }

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
end
