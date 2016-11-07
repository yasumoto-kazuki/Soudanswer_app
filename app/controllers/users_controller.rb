class UsersController < ApplicationController

  before_action :user_params, only:[:edit, :update, :create]


  def show
  end

  def edit
    @studies = user.studies.page(params[:page]).per(5).order("created_at DESC")
    @courses = user.courses.page(params[:page]).per(5).order("created_at DESC")
  end

  def update
    @studies = user.studies.page(params[:page]).per(5).order("created_at DESC")
    @courses = user.courses.page(params[:page]).per(5).order("created_at DESC")
  end


  def create
    @studies = user.studies.page(params[:page]).per(5).order("created_at DESC")
    @courses = user.courses.page(params[:page]).per(5).order("created_at DESC")
    @genders = user.genders.page(params[:page]).per(5).order("created_at DESC")
  end

  private
  def user_params
    user = User.find(params[:id])
    @nickname = user.nickname
    @gender = user.gender
    @grade = user.grade
  end
end
