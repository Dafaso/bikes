class Bike < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :shop

  validates_presence_of :shop_id, :manufacturer_id
end
