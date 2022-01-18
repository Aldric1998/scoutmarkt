class Demand < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  #rent manually
  belongs_to :rent
  has_many :reviews
end
