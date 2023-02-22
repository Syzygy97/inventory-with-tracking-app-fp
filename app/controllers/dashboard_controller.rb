class DashboardController < ApplicationController
  def index
    @markers = Marker.all
  end
end
