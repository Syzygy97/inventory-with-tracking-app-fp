class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders.order("transaction_date desc")
  end

  def show
  end

  def new
  end

  def create
    
  end
  def destroy
  end

  private

  
end
