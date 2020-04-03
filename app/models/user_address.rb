class UserAddress < ApplicationRecord

  # has_many :orders
  belongs_to :user

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/

  validates :last_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,      presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :postcode,        presence: true
  validates :prefecture,      presence: true
  validates :city	,           presence: true
  validates :block,           presence: true
end
