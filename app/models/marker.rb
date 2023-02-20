class Marker < ApplicationRecord
  belongs_to :asset

  validates :name, :description, :latitude, :longitude, :address, presence: true
end
