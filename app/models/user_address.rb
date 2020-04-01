class UserAddress < ApplicationRecord
  belongs_to :user

  validates :last_name,       presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name,      presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :last_name_kana,  presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :postcode,        presence: true
  validates :prefecture,      presence: true
  validates :city	,           presence: true
  validates :block,           presence: true
end
