Rails.application.routes.draw do
  namespace :api do
    resource :user, only: :create
  end
end
