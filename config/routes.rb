Rails.application.routes.draw do

  resources :texts
  resources :settings
  resources :softwarerechtes
  resources :lagers
  resources :antrag_statuses
  resources :antrag_typs
  resources :antrags do
    member do
      get :dreamSpark
      post :dreamSpark
      get :hub
    end
  end
  resources :invetars  do
    member do
        get :hub
        patch :ausleihen
        patch :zuruek
        get :pdf
    end
  end
  resources :invetar_typs
  resources :sessions
  resources :members

  get 'kasse/kasse'
  patch 'kasse/kasse'
  get '/kassenext' => 'kasse#next_kunde'

  resources :order_statuses
  resources :orders do
    member do
      get :print
      patch :doPrint
      patch :qOrder
      get :qOrder
      patch :doSort
      post :extPrint
      patch :massOrder
    end
  end
  resources :studenten_statuses
  resources :kasse do
    member do
      patch :bestellen
      patch :order
      patch :orderDelete
      patch :ausgegeben
      get :logoutKunde
      patch :uplode      
    end
  end

  resources :students
  resources :professors
  resources :moduls
  resources :studiengangs
  resources :dateien_kategoriens
  resources :datens
  resources :users
  root "kasse#index"
end
