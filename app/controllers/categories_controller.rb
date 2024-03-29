class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy]
  before_action :correct_user, only: [ :edit, :update, :destroy, :show ]

  def index
    @categories = current_user.categories
  end

  def show
    @q = @category.assets.ransack(params[:q])
    @pagy, @assets = pagy(@q.result(distinct: true), items: 3)
    @all_user_assets = @category.assets
    # @assets = @q.result(distinct: true)
    # @pagy, @assets = pagy(@category.assets, items: 3)
  end

  def new 
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "New category was created successfully"
    else
      render :new, alert: "Unable to create a new category"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to dashboard_path, notice: "Not Authorized" if @category.nil?
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :user_id) 
  end
end
