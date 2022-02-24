class Offer < ApplicationRecord
  belongs_to :user
  has_many :demands
  geocoded_by :address
  # reverse_geocoded_by :latitude, :longitude, :address => :address
  # after_validation :reverse_geocode
  after_validation :geocode, if: :will_save_change_to_address?
  # after_validation :geocode, if: :will_save_change_to_address?
end
