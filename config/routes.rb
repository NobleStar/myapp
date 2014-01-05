Myapp::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  # to allow unauthenticated users to enter home/index
  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new", :as => :login
    end
  end

  # to allow authenticated users to enter home/index
  authenticated :user do
    devise_scope :user do
      root to: "home#index", :as => :home
    end
  end

  resources :users
end