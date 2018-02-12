Rails.application.routes.draw do
  resources :blocks


root to: 'blocks#index'
end
