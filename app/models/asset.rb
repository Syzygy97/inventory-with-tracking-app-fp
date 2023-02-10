class Asset < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :markers
end
