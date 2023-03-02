class Category < ApplicationRecord
  belongs_to :user
  has_many :assets
  has_many :markers, through: :assets
  
  validates :name, :description, :user_id, presence: true

end