class LearnsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :move_to_index, except: [:index, :new, :create, :show, :search]
  before_action :set_learn, only: [:show, :edit, :update, :destroy]

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
    @comments = @learn.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @learn.update(learn_params)
      redirect_to learn_path
    else
      render :edit
    end
  end

  def destroy
    if @learn.destroy
      redirect_to root_path
    end
  end

  def search
    @learns = Learn.search(params[:keyword])
  end

  private

  def learn_params
    params.require(:learn).permit(:image, :title, :description, :subject_id, :study_hour, :study_minutes).merge(user_id: current_user.id)
  end

  def move_to_index
    @learn = Learn.find(params[:id])
    unless user_signed_in? && current_user.id == @learn.user_id
      redirect_to action: :index
    end
  end

  def set_learn
    @learn = Learn.find(params[:id])
  end

end
