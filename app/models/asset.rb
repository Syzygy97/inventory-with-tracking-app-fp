class Asset < ApplicationRecord
  belongs_to :category
  # has_many :orders
  # has_many :markers

  validates :name, :description, :quantity, :classification, :status, :purchase_date, :invoice_number, presence: true

end
