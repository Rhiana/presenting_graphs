Rails.application.routes.draw do
  resources :line_graphs
  resources :bar_graphs
  resources :circle_graphs
  root 'welcome#show'
end
