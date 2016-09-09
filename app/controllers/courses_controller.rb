class CoursesController < ApplicationController

  before_action :move_to_home, except: [:index, :show]

  def index
    @courses = Course.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @course = Course.find(params[:id])
    @course_comments = @course.course_comments.includes(:user).order("created_at DESC")
  end

  def new
  end

  def create
    Course.create(title: course_params[:title], content: course_params[:content], user_id: current_user.id)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    if course.user_id == current_user.id
        course.update(course_params)
      end
  end

  def destroy
    course = Course.find(params[:id])
    if course.user_id == current_user.id
      course.destroy
    end
  end


  private
  def course_params
    params.permit(:title, :content)
  end

  def move_to_home
    redirect_to controller: :top, action: :index unless user_signed_in?
  end
end
