class LearnsController < ApplicationController

  def index
    @learns = Learn.all.order("created_at DESC")
  end

  def new
    @learn = Learn.new
  end

  def create
    @learns = Learn.new(learn_params)
    if @learns.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @learn = Learn.find(params[:id])
    @comments = @learn.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @learn = Learn.find(params[:id])
  end

  def update
    @learn = Learn.find(params[:id])
    if @learn.update(learn_params)
      redirect_to learn_path
    else
      render :edit
    end
  end

  def destroy
    @learn = Learn.find(params[:id])
    if @learn.destroy
      redirect_to root_path
    end
  end

  private

  def learn_params
    params.require(:learn).permit(:image, :title, :description, :subject_id, :study_hour, :study_minutes).merge(user_id: current_user.id)
  end

end
