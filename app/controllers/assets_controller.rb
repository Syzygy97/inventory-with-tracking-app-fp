class AssetsController < ApplicationController
  before_action :set_category, only: %i[ index show new create ]
  before_action :set_asset, only: %i[ show edit update destroy]

  def index
    @assets = @category.assets
  end

  def show
  end

  def new
    @asset = @category.assets.new
  end

  def create
    @asset = @category.assets.new(asset_params)
    if @asset.save
      redirect_to category_path(@category), notice: "Successfully created a new asset"
    else
      render :new, alert: "Unable to create a new category"
    end 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_asset
    @asset = @category.assets.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:name, :description, :quantity, :classification, :status, :purchase_date, :invoice_number)
    
  end
end
