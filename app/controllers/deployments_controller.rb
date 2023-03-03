class DeploymentsController < ApplicationController
  def index
    @deployments = current_user.deployments.order("deployment_date desc")
  end
end
