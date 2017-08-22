class Api::UsersController < ApplicationController
  skip_before_action :authenticate, only: :create

  private
  def collection
    @users ||= User.all  
  end

  def resource
    current_user
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :sex,
      :birthday, :lat, :lng)
  end

  def build_resource
    @user = User.new resource_params
  end
end