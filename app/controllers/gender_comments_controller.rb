class GenderCommentsController < ApplicationController

  def create
    @gender_comment = GenderComment.create(text: gender_comment_params[:text], gender_id: gender_comment_params[:gender_id], user_id: current_user.id)
    redirect_to "/genders/#{@gender_comment.gender.id}"
  end

  private
  def gender_comment_params
    params.permit(:text, :gender_id)
  end

end
