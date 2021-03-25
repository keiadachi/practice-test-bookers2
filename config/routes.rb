Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  #topをルートパス
  get "home/about" => "homes#about"
  #about画面をURLに記載
  resources :users
  
  resources :books

end
