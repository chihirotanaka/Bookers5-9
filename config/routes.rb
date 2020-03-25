Rails.application.routes.draw do
  devise_for :users
  root 'homes#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about' => 'homes#about', as: "about"
  #  よく使う７つ以外は自分で打つ↑
  resources :users, only:[:index, :show, :edit, :update]
  resources :books, only:[:index, :edit, :show, :create, :update, :destroy]

end
