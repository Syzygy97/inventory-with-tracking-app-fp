class Map < ApplicationRecord
  has_many :markers

  validates :name, :latitude, :longitude, presence: true
end
