Rails.application.routes.draw do
  devise_for :users
  root to: 'material_nums#index'
  resources :material_nums, only: [:index, :new, :create]
  resources :product_nums,  only: [:new, :create]

end
