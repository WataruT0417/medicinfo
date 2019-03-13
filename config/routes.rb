Rails.application.routes.draw do
  patch 'medicines/:id', to: 'medicines#update', as: 'update_medicine'
  get 'medicines', to: 'medicines#home'
  get 'medicines/new'
  get 'medicines/:id/edit', to: 'medicines#edit'
  post 'medicines',  to: 'medicines#create'
  delete 'medicines/:id/destroy', to: 'medicines#destroy'  
  get 'medicines/filter', to: 'medicines#filter'
  root 'medicines#home'
  resources :medicines
end