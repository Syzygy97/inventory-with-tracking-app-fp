class Asset < ApplicationRecord
  belongs_to :category
  has_many :markers

  validates :name, :description, :quantity, :classification, :status, :purchase_date, :invoice_number, :price, presence: true

end
