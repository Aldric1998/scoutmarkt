class Rent < ApplicationRecord
  #manually
  belongs_to :user
  has_many :demands
  reverse_geocoded_by :latitude, :longitude, :address => :localisation
  after_validation :reverse_geocode
end
