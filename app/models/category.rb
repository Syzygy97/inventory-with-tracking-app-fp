class Category < ApplicationRecord
  has_many :assets
  validates :name, :description, presence: true

end
