class Category < ApplicationRecord
  belongs_to :good
  has_ancestry
end
