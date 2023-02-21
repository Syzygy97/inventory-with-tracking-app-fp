class MapsController < ApplicationController
  def index
    @markers = Marker.all
  end

  def show
  end

  def new
  end

  def destroy
  end
end
