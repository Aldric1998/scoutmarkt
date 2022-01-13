class Offer < ApplicationRecord
  belongs_to :user
  has_many :demands
end
