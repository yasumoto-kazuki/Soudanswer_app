class UsersController < ApplicationController


  def show
  end

  def edit
    user = User.find(params[:id])
    @nickname = user.nickname
    @gender = user.gender
    @grade = user.grade
    @studies = user.studies.page(params[:page]).per(5).order("created_at DESC")
    @courses = user.courses.page(params[:page]).per(5).order("created_at DESC")
  end

  def update
    user = User.find(params[:id])
    @nickname = user.nickname
    @gender = user.gender
    @grade = user.grade
    @studies = user.studies.page(params[:page]).per(5).order("created_at DESC")
    @courses = user.courses.page(params[:page]).per(5).order("created_at DESC")
  end


  def create
    user = User.find(params[:id])
    @nickname = user.nickname
    @gender = user.gender
    @grade = user.grade
    @studies = user.studies.page(params[:page]).per(5).order("created_at DESC")
    @courses = user.courses.page(params[:page]).per(5).order("created_at DESC")
    @genders = user.genders.page(params[:page]).per(5).order("created_at DESC")
  end
end
