Rails.application.routes.draw do
  devise_for :users , :controllers => {registrations: 'registrations'}
  resources :posts do 
    resources :comments
    resources :likes
  end
  resources :events
  resources :events_users
  resources :friendships
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
