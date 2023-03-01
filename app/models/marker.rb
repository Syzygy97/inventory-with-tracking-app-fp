class Marker < ApplicationRecord
  belongs_to :asset

  validates :name, :description, :latitude, :longitude, :address, :deployment_date, :deployment_time, presence: true
end
