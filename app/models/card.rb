class Card < ApplicationRecord
  has_one :user

  with_options presence: true do
    validates :user_id
    validates :customer_id
    validates :card_id
  end
end
