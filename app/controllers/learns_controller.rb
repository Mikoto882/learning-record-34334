class LearnsController < ApplicationController

  def index
    @learns = Learn.all.order("created_at DESC")
  end

  def new
    @learn = Learn.new
  end

  def create
    @learns = Learn.new(learn_params)
  end

  private

  def learn_params
    params.require(:learn).permit(:image, :title, :description, :subject_id, :study_hour, :study_minutes).merge(user_id: current_user.id)
  end

end
