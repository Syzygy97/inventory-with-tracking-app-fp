class DashboardController < ApplicationController
  def index
    @markers = Marker.all
    @orders = Order.all
    @deployments = Deployment.all
  end
end
