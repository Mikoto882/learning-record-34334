class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to template: "learns/show"
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, learn_id: params[:learn_id])
  end

end
