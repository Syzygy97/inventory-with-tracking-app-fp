class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @markers = current_user.categories&.map(&:markers).flatten
    @orders = current_user.orders
    @deployments = current_user.deployments
  end

end
