Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "file_items#index"

  get "file_items/download/:id" => "file_items#download", as: "file_download"

  resources :file_items, only: [:new, :create, :destroy]
end
