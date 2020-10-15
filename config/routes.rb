Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/home', to: 'users#home'
      get '/populate', to: 'users#populate'
      resources :quizzes do 
        post '/favorite', to: 'quizzes#favorite'
        delete '/unfavorite', to: 'quizzes#unfavorite'
        resources :questions, only: [:update, :show, :create, :destroy] 
      end
      resources :decks do 
        post '/favorite', to: 'decks#favorite'
        delete '/unfavorite', to: 'decks#unfavorite'
        resources :cards, only: [:update, :show, :create, :destroy]
      end
    end
  end


end
