class ShopMachine < ApplicationRecord
  belongs_to :shop
  belongs_to :machine

  validates :shop_id,    presence: true
  validates :machine_id, presence: true
  validates :price,      presence: true
  validates :own,        presence: true
end
