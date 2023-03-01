class Asset < ApplicationRecord
  belongs_to :category
  has_many :markers

  validates :name, :description, :quantity, :classification, :status, :purchase_date, :price, presence: true
  validates :classification, inclusion: { in: %w[Undeployable Deployable] }

  enum :status, {Available: 0, Deployed: 1}
  enum :classification, {Undeployable: 0, Deployable: 1}
end
