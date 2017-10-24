Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  
  root to: 'journeys#index'
  
  resources :journeys do 
  	get 'choosing_places', to: 'journeys#choosing_places', as: :choosing_places
  	post 'bought_tickets', to: 'journeys#bought_tickets', as: :bought_tickets
  	delete 'return_tickets/:user_id', to: 'journeys#return_tickets', as: :return_tickets


  end

  scope 'journeys/search', as: :search do
      post '/(:page)', to: 'journeys#search', constraints: {page: /\d+/}
      get '/(:page)', to: 'journeys#search', constraints: {page: /\d+/}
      post '/', to: 'journeys#search'
      get '/', to: 'journeys#search'
    end
  
end
