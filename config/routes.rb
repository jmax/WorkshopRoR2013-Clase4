MiTwitter::Application.routes.draw do
  devise_for :users

  get "home/index"

  resources :tweets, only: [:index, :new, :create, :destroy] do
    member do
      put :report
    end
  end

  root to: "home#index"
end
