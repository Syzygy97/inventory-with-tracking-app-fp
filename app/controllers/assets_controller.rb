class AssetsController < ApplicationController
  before_action :get_category

  def index
    @assets = @category.assets
  end

  def show
    @asset = @category.assets.find(params[:id])
  end

  def new
    @asset = @category.assets.build
  end

  def create
    @asset = @category.assets.build(asset_params)
    if @asset.save
      redirect_to category_assets_path
    else
      render :new
    end
  end

  def edit
    @asset = @category.assets.find(params[:id])
  end

  def update
    @asset = @category.assets.find(params[:id])

    if @asset.update(asset_params)
      redirect_to category_assets_path
    else
      render :edit
    end
  end

  def destroy
    @asset = @category.assets.find(params[:id])
    @asset.destroy
    redirect_to category_assets_path 
  end

  private 
  def get_category
      @category = Category.find(params[:category_id])
  end

  def asset_params
      params.require(:asset).permit(:name, :description, :classification, :status, :quantity, :purchase_date, :invoice_number)
  end
end
