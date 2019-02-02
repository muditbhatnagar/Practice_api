Rails.application.routes.draw do
  resources :songs
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'
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
      	match 'auth/:provider/callback', to: 'sessions#google_login',  via: [:get, :post]
				match '/auth/failure', :to => 'sessions#failure',  via: [:get, :post]
				post '/google_login', :to => 'sessions#google_login'
				get '/profile', :to => 'users#profile'
        #post '/create_song', :to => 'songs#create_song'
        resources :songs
				#put '/profile', to => 'users#profile_update'
    end
  end

end
