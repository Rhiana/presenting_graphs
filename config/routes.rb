Rails.application.routes.draw do
  resources :gauge_graphs
  resources :line_graphs
  resources :bar_graphs
  resources :circle_graphs
  root 'welcome#show'
end
