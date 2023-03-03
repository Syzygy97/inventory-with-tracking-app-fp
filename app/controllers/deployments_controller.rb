class DeploymentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @deployments = current_user.deployments.order("deployment_date desc")
  end
end
