class MarkersController < ApplicationController
  # before_action :set_category
  before_action :set_asset, only: %i[ index show new create ]
  before_action :set_marker, only: %i[ show edit update destroy]

  def index
    @markers = @asset.markers
  end

  def show
  end

  def new
    @marker = @asset.markers.new
  end

  def create
    @marker = @asset.markers.new(marker_params)
    if @marker.save
      redirect_to maps_path, notice: "Successfully added a new marker"
    else
      render :new, alert: "Unable to create a new marker"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # def set_category
  #   @category = Category.find(params[:category_id])
  # end
  def set_asset
    @asset = Asset.find(params[:asset_id])
  end
  def set_marker
    @marker = @asset.markers.find(params[:id])
  end
  def marker_params
    params.require(:marker).permit(:name, :description, :latitude, :longitude, :elevation, :address)
  end
end
