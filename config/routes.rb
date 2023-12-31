Rails.application.routes.draw do
  devise_for :users
  root to: 'count_days#index'
  resources :material_nums, only: [:index, :new, :create]
  resources :product_nums,  only: [:new, :create]
  resources :count_days, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :material_counts, only:[:new, :create]
    resources :product_counts, only:[:new, :create]
    resources :material_plans, only:[:new, :create]
    resources :product_plans, only:[:new, :create]
    resources :material_buys, only:[:new, :create]
    resources :product_makes, only:[:new, :create]
    resources :export_plans, only:[:new, :create]
  end

end
