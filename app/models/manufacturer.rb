class Manufacturer < ApplicationRecord
  has_many :bikes
  has_many :shops, through: :bikes
end
