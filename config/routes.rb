Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "comments#index"
  get 'index' => 'comments#index'
  resources :comments
  resources :replies
  resources :projects
  resources :project_relations
  resources :categories
  resources :vessels
  resource :dashboards
end
