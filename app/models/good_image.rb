class GoodImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :good

  validates :image, presence: true
end

