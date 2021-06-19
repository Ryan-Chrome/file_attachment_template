class FileItem < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :image_file, presence: true

  has_one_attached :image_file
end
