Rails.application.routes.draw do
  devise_for :users
  root to: 'count_days#index'
  resources :material_nums, only: [:index, :new, :create]
  resources :product_nums,  only: [:new, :create]
  resources :count_days, only:[:index, :new, :create, :show, :edit, :update, :destroy]

end
