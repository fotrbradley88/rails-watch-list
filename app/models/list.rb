class List < ApplicationRecord
  has_many :movies

  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
