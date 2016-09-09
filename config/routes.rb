Rails.application.routes.draw do
  devise_for :users

  root "top#index"
  get "/select" => "top#show"
  get "/mypage/:id/studies" => "users#edit"
  get "/mypage/:id/courses" => "users#update"
  get "/mypage/:id/genders" => "users#create"

  get "/after/log-in" => "devise_view#index"
  get "/after/log-out" => "devise_view#create"
  get "/after/register" => "devise_view#new"


  resources :studies do
    resources :comments, only: [:create]
  end

  resources :courses do
    resources :course_comments, only: [:create]
  end

  resources :genders do
    resources :gender_comments, only: [:create]
  end

  resources :users, only: [:show]


  #get "studies" => "studies#index"
  #get "studies/new" => "studies#new"
  #post "studies" => "studies#create"
  #get "users/:id" => "users#show"
  #delete "studies/:id" => "studies#destroy"
  #get "studies/:id/edit" => "studies#edit"
  #patch "studies/:id" => "studies#update"
  #get "studies/:id" => "studies#show"


end
