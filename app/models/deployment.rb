class Deployment < ApplicationRecord
  belongs_to :user
  
  validates :vehicle_name, :address, :quantity, :price, :deployment_date, :deployment_time, :status, :user_id, presence: true

  enum :status, {Outgoing: 0, Incoming: 1}
end
