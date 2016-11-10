class GendersController < ApplicationController

  before_action :move_to_home, except: [:index, :show]

  def index
    @genders = Gender.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @gender = Gender.find(params[:id])
    @gender_comments = @gender.gender_comments.includes(:user).order("created_at DESC")
  end

  def new
  end

  def create
    Gender.create(title: gender_params[:title], content: gender_params[:content], user_id: current_user.id)
  end

  def edit
    @gender = Gender.find(params[:id])
  end

  def update
    gender = Gender.find(params[:id])
    if gender.user_id == current_user.id
        gender.update(gender_params)
      end
  end

  def destroy
    gender = Gender.find(params[:id])
    if gender.user_id == current_user.id
      gender.destroy
    end
  end

  private
  def gender_params
    params.permit(:title, :content)
  end

  def move_to_home
    redirect_to controller: :top, action: :index unless user_signed_in?
  end

end
