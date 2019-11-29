class Event < ApplicationRecord
  belongs_to :shop
  validates :shop_id,    presence: true
  validates :event_date, presence: true
  validates :content,    presence: true,
                         length: {maximum: 255}
end
