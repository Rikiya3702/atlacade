class Shop < ApplicationRecord
  belongs_to :user
  validates :shop_name, presence: true,
                        length: {maximum: 50}
  validates :tel,       presence: true,
                        length: {maximum: 20},
                        uniqueness: true
  mount_uploader :image, ImageUploader
end
