class Shop < ApplicationRecord
  has_many :bikes
  has_many :manufacturers, through: :bikes

  attr_accessor :manufacturer


  validates_presence_of :name, :location, :street1, :city, :state

end
