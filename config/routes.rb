Rails.application.routes.draw do
  resources :bar_graphs
  resources :circle_graphs
  root 'circle_graphs#index'
end
