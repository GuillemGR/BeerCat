Rails.application.routes.draw do
  devise_for :admins
  resources :cathegories
  devise_for :users
  resources :products
  root 'welcome#index'
  get '/welcome', to: 'welcome#index'
  get '/addcart/:id', to: 'command#add_to_cart', as: 'addcart'
  get '/cart', to: 'command#cart', as: 'cart'
  get '/paycart', to: 'command#pay_cart', as: 'pay_cart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
