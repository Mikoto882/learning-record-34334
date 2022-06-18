class ProfilesController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @profile = Profile.find(parmas[:id])
  end

  def update
    @user = User.find(params[:id])
    @profile = Profile.find(parmas[:id])
    if @user.update(user_params) && @profile.update(profile_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end

  def profile_params
    params.require(:profile).permit(:introduction, :grade_id).marge(user_id: current_user.id)
  end

end
