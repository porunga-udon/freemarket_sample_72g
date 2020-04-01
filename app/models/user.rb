class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :user_address


  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  VALID_NUMBER_REGEX = /\A[0-9]+\z/

  validates :name,               presence: true, uniqueness: true
  validates :email,              presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 7 }
  validates :last_name,          presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,     presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,    presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_year,         presence: true
  validates :birth_month,        presence: true
  validates :birth_day,          presence: true
  validates :phone_number,       format: { with: VALID_NUMBER_REGEX }
end
