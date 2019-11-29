class Shop < ApplicationRecord
  belongs_to :user
  has_one :tag, dependent: :destroy
  has_many :event, dependent: :destroy
  has_many :shop_machine, dependent: :destroy
  has_many :machine, through: :shop_machine
  accepts_nested_attributes_for :tag
  geocoded_by :adress
  after_validation :geocode
  validates :shop_name, presence: true,
                        length: {maximum: 50}
  validates :tel,       presence: true,
                        length: {maximum: 20},
                        uniqueness: true
  validates :adress,          length: {maximum: 50}
  validates :access,          length: {maximum: 50}
  validates :business_hours,  length: {maximum: 50}
  validates :nearest_station, length: {maximum: 50}
  validates :shop_info,       length: {maximum: 255}
  validates :official_url,    length: {maximum: 100}
  mount_uploader :image, ImageUploader

  def self.search_adress(query)
    if query
      where(['adress LIKE ?', "#{query}%"])
    else
      all
    end
  end
end
