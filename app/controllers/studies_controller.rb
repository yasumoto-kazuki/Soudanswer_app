class StudiesController < ApplicationController

  before_action :move_to_home, except: [:index, :show]

  def index
    @studies = Study.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @study = Study.find(params[:id])
    @comments = @study.comments.includes(:user).order("created_at DESC")
  end

  def new
  end

  def create
    Study.create(title: study_params[:title], content: study_params[:content], user_id: current_user.id)
  end

  def edit
    @study = Study.find(params[:id])
  end

  def update
    study = Study.find(params[:id])
    if study.user_id == current_user.id
        study.update(study_params)
      end
  end

  def destroy
    study = Study.find(params[:id])
    if study.user_id == current_user.id
      study.destroy
    end
  end

  private
  def study_params
    params.permit(:title, :content)
  end

  def move_to_home
    redirect_to controller: :top, action: :index unless user_signed_in?
  end
end
