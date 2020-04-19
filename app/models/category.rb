class Category < ApplicationRecord
  has_one :good
  has_ancestry
end
