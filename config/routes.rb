Rails.application.routes.draw do
  get 'kasse/kasse'

  resources :studenten_statuses
  resources :students
  resources :professors
  resources :moduls
  resources :studiengangs
  resources :dateien_kategoriens
  resources :datens
  resources :users
  root "datens#filtered"
end
