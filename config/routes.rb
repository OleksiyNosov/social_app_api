Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :create, :update]

    resource :sessions, only: [:create, :destroy]
  end
end
