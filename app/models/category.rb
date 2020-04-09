class Category < ApplicationRecord
  has_many :good
  has_ancestry
end
