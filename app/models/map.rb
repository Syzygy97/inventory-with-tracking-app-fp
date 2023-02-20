class Map < ApplicationRecord
  validates :name, :latitude, :longitude, presence: true
end
