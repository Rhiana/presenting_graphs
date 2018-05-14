Rails.application.routes.draw do
  resources :bar_graphs
  resources :circle_graphs
  root 'welcome#show'
end
