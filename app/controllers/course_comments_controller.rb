class CourseCommentsController < ApplicationController

  def create
    @course_comment = CourseComment.create(text: course_comment_params[:text], course_id: course_comment_params[:course_id], user_id: current_user.id)
    redirect_to "/courses/#{@course_comment.course.id}"
  end

  private
  def course_comment_params
    params.permit(:text, :course_id)
  end
end
