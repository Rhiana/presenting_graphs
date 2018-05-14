Rails.application.routes.draw do
  resources :circle_graphs
  root 'circle_graphs#index'
end
