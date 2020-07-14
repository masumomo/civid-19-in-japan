Rails.application.routes.draw do
  get 'static_pages/about'
  root 'home#index'
  get 'home/index'
  resources :total
  resources :statistic
end
