class Rent < ApplicationRecord
  #manually
  belongs_to :user
  has_many :demands
end
