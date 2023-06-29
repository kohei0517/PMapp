Rails.application.routes.draw do
  devise_for :users
  root to: 'material_nums#index'
  resources
end
