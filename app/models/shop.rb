class Shop < ApplicationRecord
  belongs_to :user
  has_one :tag, dependent: :destroy
  has_many :shop_machine, dependent: :destroy
  has_many :machine, through: :shop_machine
  accepts_nested_attributes_for :tag
  validates :shop_name, presence: true,
                        length: {maximum: 50}
  validates :tel,       presence: true,
                        length: {maximum: 20},
                        uniqueness: true
  mount_uploader :image, ImageUploader
end
