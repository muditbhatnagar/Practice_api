Rails.application.routes.draw do
	root 'users#index'
  apipie
  devise_for :users

  # namespace :api do
  #   namespace :v1 do
  #   	# resources :users, only: [:index]
  #       post "/sign_in", :to => 'sessions#create'
  #       post "/sign_up", :to => 'registrations#create'
  #       put '/change_password', to: 'registrations#change_password'
  #       get "/profile", :to => 'registrations#profile'
  #       post "/update_account", :to => 'registrations#update'
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #devise_for :users
      resources :users, :only => [:show, :create, :index, :update, :destroy]
      	post "/sign_up", :to => 'registrations#create'
      	put '/change_password', to: 'registrations#change_password'
      	get "users/download_pdf"
    end
  end

end
