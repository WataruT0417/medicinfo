Rails.application.routes.draw do
  get 'medicines', to: 'medicines#home'
  get 'medicines/new'
  root 'medicines#home'
end
