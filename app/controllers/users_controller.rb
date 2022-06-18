class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @learns = user.learns.order("created_at DESC")
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :introduction, :grade_id)
  end

end
