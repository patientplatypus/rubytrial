class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    
    if user.save
      render json: user
    else
      render json: user.errors.details
    end
    # hellothere = 'sailor'
    # name_in_users = User.where(name: params[:name])
    # p hellothere
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
