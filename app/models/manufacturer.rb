class Manufacturer < ApplicationRecord
  has_many :bikes
  has_many :shops, through: :bikes

  validates_presence_of :name, :location, :website

end
