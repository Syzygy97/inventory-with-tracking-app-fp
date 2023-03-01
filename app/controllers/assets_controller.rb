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
      @order = Order.create(
        :name => @asset.name,
        :quantity => @asset.quantity,
        :price => (@asset.price * @asset.quantity),
        :classification => "Purchase",
        :transaction_date => @asset.purchase_date
      )
      redirect_to category_path(@category), notice: "Successfully created a new asset"
    else
      render :new, alert: "Unable to create a new category"
    end 
  end

  def edit
  end

  def update
    current_quantity = @asset.quantity
    if @asset.update(asset_params)
      if asset_params["quantity"].to_i < current_quantity
        @order = Order.create(
          :name => @asset.name,
          :quantity => (current_quantity - asset_params["quantity"].to_i),
          :price => (@asset.price * (current_quantity - asset_params["quantity"].to_i)),
          :classification => "Sell",
          :transaction_date => Time.now
        )
        redirect_to category_asset_path
      elsif asset_params["quantity"].to_i > current_quantity
        @order = Order.create(
          :name => @asset.name,
          :quantity => (asset_params["quantity"].to_i - current_quantity),
          :price => (@asset.price * (asset_params["quantity"].to_i - current_quantity)),
          :classification => "Purchase",
          :transaction_date => Time.now
        )
        redirect_to category_asset_path
      else
        redirect_to category_asset_path
      end
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_asset
    set_category
    @asset = @category.assets.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:name, :description, :quantity, :classification, :status, :purchase_date, :invoice_number, :price, :notes, :image, pictures: [])
  end

  def order_params
    params.require(:order).permit(:name, :quantity, :price, :classification, :transaction_date)
  end
end
