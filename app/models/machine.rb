class Machine < ApplicationRecord
  has_many :shop_machine, dependent: :destroy
  has_many :shop, through: :shop
  validates :title, presence: true, length: {maximum: 50}
  mount_uploader :image, ImageUploader

end
