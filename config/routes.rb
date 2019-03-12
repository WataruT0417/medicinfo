Rails.application.routes.draw do
  get 'medicines', to: 'medicines#home'
  get 'medicines/new'
  get 'medicines/:id/edit', to: 'medicines#edit'
  patch 'medicines/:id/edit', to: 'medicines#update'
  post 'medicines',  to: 'medicines#create'
  delete 'medicines/:id/destroy', to: 'medicines#destroy'
  root 'medicines#home'
  resources :medicines
end