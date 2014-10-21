Rails.application.routes.draw do
  namespace :api do
    namespace :tessel do
      post 'register'
      post 'ping'
    end
  end
end
