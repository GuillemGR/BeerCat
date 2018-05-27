Rails.application.routes.draw do
  get '/admins/sign_up', to: 'welcome#index'
  devise_for :admins
  resources :cathegories
  devise_for :users
  resources :products
  root 'welcome#index'
  get '/welcome', to: 'welcome#index'
  get '/addcart/:id', to: 'command#add_to_cart', as: 'addcart'
  get '/cart', to: 'command#cart', as: 'cart'
  get '/paycart', to: 'command#pay_cart', as: 'pay_cart'
  get '/userpanel', to: 'user_panel#index', as: 'user_panel'
  get '/commandetails/:id', to: 'user_panel#command_details', as: 'command_details'
  get '/adminpanel', to: 'admin_panel#index', as: 'admin_panel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
