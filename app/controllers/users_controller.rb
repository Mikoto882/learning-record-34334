class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @learns = user.learns.order("created_at DESC")
  end

end
