class ProfilesController < ApplicationController
  before_action :move_to_new, except: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(parmas[:id])
  end

  def update
    @profile = Profile.find(parmas[:id])
    if current_user.update(user_params) && @profile.update(profile_params)
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

  def move_to_new
    if current_user.id == nil
      redirect_to action: :new
    end
  end

end
