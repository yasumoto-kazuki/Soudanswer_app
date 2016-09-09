class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: comment_params[:text], study_id: comment_params[:study_id], user_id: current_user.id)
    redirect_to "/studies/#{@comment.study.id}"
  end

  private
  def comment_params
    params.permit(:text, :study_id)
  end
end
