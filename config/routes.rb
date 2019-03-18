Rails.application.routes.draw do

  patch 'medicines/:id', to: 'medicines#update', as: 'update_medicine'
  get 'medicines', to: 'medicines#home'
  get 'medicines/new'
  get 'medicines/:id/edit', to: 'medicines#edit'
  post 'medicines',  to: 'medicines#create'
  delete 'medicines/:id/destroy', to: 'medicines#destroy'  
  get 'medicines/filter', to: 'medicines#filter'
  
  get 'masters', to: 'masters#home'
  
  get 'staffs', to: 'staffs#home'
  get 'staffs/new', to: 'staffs#new'
  post 'staffs',  to: 'staffs#create'
  delete 'staffs/:id/destroy', to: 'staffs#destroy'  

  root 'medicines#home'
  
  resources :staffs
  resources :medicines
  resources :masters
end