Rails.application.routes.draw do

  patch 'medicines/:id', to: 'medicines#update', as: 'update_medicine'
  get 'medicines', to: 'medicines#home'
  get 'medicines/new'
  get 'medicines/:id/edit', to: 'medicines#edit'
  post 'medicines',  to: 'medicines#create'
  delete 'medicines/:id/destroy', to: 'medicines#destroy'  
  get 'medicines/filter', to: 'medicines#filter'
  get 'medicines/:id/output', to: 'medicines#output'

  patch 'reactions/:id', to: 'reactions#update', as: 'update_reaction'
  get 'reactions', to: 'reactions#home'
  get 'reactions/new'
  get 'reactions/:id/edit', to: 'reactions#edit'
  post 'reactions',  to: 'reactions#create'
  delete 'reactions/:id/destroy', to: 'reactions#destroy'  
  get 'reactions/filter', to: 'reactions#filter', as: 'reactions_filter'

  patch 'doubts/:id', to: 'doubts#update', as: 'update_doubt'
  get 'doubts', to: 'doubts#home'
  get 'doubts/new'
  get 'doubts/:id/edit', to: 'doubts#edit'
  post 'doubts',  to: 'doubts#create'
  delete 'doubts/:id/destroy', to: 'doubts#destroy'  
  get 'doubts/filter', to: 'doubts#filter', as: 'doubts_filter'

  get 'masters', to: 'masters#home'
  
  get 'staffs', to: 'staffs#home'
  get 'staffs/new', to: 'staffs#new'
  post 'staffs',  to: 'staffs#create'
  delete 'staffs/:id/destroy', to: 'staffs#destroy'

  root 'medicines#home'
  
  resources :medicines
  resources :reactions
  resources :doubts
  resources :masters
  resources :staffs
  
end