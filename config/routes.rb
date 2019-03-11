Rails.application.routes.draw do
  get 'medicines', to: 'medicines#home'
  get 'medicines/new'
  get 'medicines/:id/edit', to: 'medicines#edit'
  patch 'medicines/:id/edit', to: 'medicines#update'
  post 'medicines',  to: 'medicines#create'
  root 'medicines#home'
  resources :medicines
end
