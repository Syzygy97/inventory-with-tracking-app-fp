class Category < ApplicationRecord
  belongs_to :user
  has_many :assets
  
  validates :name, :description, presence: true

end