class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :json_request?

  rescue_from ActiveRecord::RecordInvalid do
    render :errors, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  helper_method :resource, :collecion

  def index
    collection
  end

  def show
    resource
  end

  def create
    build_resource

    resource.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy!
  end

  private
  def json_request?
    request.format.json?
  end
end
