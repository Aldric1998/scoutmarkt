class Rent < ApplicationRecord
  #manually
  belongs_to :user
  has_many :demands
  # reverse_geocoded_by :latitude, :longitude, :address => :localisation
  # after_validation :reverse_geocode
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description, :address, :price, :start_date, :end_date ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
