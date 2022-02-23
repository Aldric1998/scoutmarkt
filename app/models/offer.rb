class Offer < ApplicationRecord
  belongs_to :user
  has_many :demands
  geocoded_by :localisation
  reverse_geocoded_by :latitude, :longitude, :address => :localisation
  after_validation :reverse_geocode
  after_validation :geocode, if: :will_save_change_to_localisation?
  # after_validation :geocode, if: :will_save_change_to_address?
end
