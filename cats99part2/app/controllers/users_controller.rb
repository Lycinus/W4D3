class UsersController < ApplicationController
  before_action :require_logout, only: [:new, :create]

  def new

  end

  def create
    user = User.new(user_params)
    if user.save 
      login_user!(user)
      redirect_to cats_url
    else
      render json: user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
