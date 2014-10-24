Rails.application.routes.draw do
  namespace :api do
    resources :tessels, only: :create do
      resources :checkins, only: [:create, :index]
    end
  end
end
