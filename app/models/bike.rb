class Bike < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :shop
end
