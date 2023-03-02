class Order < ApplicationRecord
  belongs_to :user

  validates :name, :quantity, :classification, :transaction_date, :price, :user_id, presence: true

  enum :classification, {Deploy: 0, Purchase: 1, Sell: 2}
end
