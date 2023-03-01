class Deployment < ApplicationRecord
  validates :vehicle_name, :address, :quantity, :price, :deployment_date, :deployment_time, :status, presence: true

  enum :status, {Outgoing: 0, Incoming: 1}
end
