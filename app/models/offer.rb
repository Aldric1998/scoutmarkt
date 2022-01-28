class Offer < ApplicationRecord
  belongs_to :user
  has_many :demands
  has_one_attached :picture
end
