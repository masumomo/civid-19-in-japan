Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'static_pages/about'
  root 'home#index'
  get 'home/index'
  resources :total
  resources :statistic
end
