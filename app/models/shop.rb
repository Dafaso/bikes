class Shop < ApplicationRecord
  has_many :bikes
  has_many :manufacturers, through: :bikes

  attr_accessor :manufacturer
end
