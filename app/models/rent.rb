class Rent < ApplicationRecord
  #manually
  belongs_to :user
  has_many :demands
  has_one_attached :picture
end
