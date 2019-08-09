Rails.application.routes.draw do
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :ingredients
    resources :doses
    resources :reviews
  end

  root to: 'cocktails#index'
end
