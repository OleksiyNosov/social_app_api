class Api::UsersController < ApplicationController

  private
  def collection
    @users ||= User.all  
  end

  def resource
    @user ||= User.find_by params[:email]
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :sex)
  end

  def build_resource
    @user = User.new resource_params
  end
end