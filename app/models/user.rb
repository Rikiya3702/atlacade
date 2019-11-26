class User < ApplicationRecord
  has_one :shop, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  validates :nickname,  presence: true,
                        length: {maximum: 50}
  validates :email,     presence: true,
                        length: {maximum: 50},
                        uniqueness: true

end
