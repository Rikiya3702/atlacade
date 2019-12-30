class Machine < ApplicationRecord
  has_many :shop_machine, dependent: :destroy
  has_many :shop, through: :shop
  validates :title, presence: true, length: {maximum: 50}
  validates :maker,        length: {maximum: 50}
  validates :genre,        length: {maximum: 50}
  validates :official_url, length: {maximum: 100}
  validates :machine_info, length: {maximum: 255}
  mount_uploader :image, ImageUploader

end
