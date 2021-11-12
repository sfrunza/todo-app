Rails.application.routes.draw do
  root to: "todo_items#index"
  resources :todo_items
  resources :todo_dates, only: [:show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
