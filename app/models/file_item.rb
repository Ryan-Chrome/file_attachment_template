class FileItem < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :image_file, presence: true
  validate :image_file, :size_validate

  has_one_attached :image_file

  def size_validate
    if image_file.blob.byte_size > 5.megabytes
      errors.add(:image_file, "は5MB以内にしてください")
    end
  end
end
