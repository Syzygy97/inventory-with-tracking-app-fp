class Order < ApplicationRecord
  # belongs_to :assets

  validates :name, :quantity, :classification, :transaction_date, :price, presence: true

  enum :classification, {Deploy: 0, Purchase: 1, Sell: 2}
end
