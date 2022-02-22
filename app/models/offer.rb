class Offer < ApplicationRecord
  belongs_to :user
  has_many :demands
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_address?
end
