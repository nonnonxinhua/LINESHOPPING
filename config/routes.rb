Rails.application.routes.draw do

  root 'user/homes#top'
  namespace :user do
    root 'homes#top'
    resources :items
    resources :users
    resources :customers
    resources :genres
    delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
    resources :cart_items

    resources :orders
    post "orders/confirmation" => "orders#confirmation"
    get "orders/completion" => "orders#completion"


#     resources :items

#     get 'top' => 'homes#top'

#     scope module: :user do
#     delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
#     resources :cart_items, only: [:destroy,:index,:update,:create]

#     end
  end

    devise_for :users, path: "user"
    get 'user/sign_in', to: 'user/users/sessions#new', as: :user_new_sessions
    match 'user/sign_in', to: 'user/users/sessions#create', via: :post, as: :user_sessions
    delete 'user/sign_out', to: 'user/users/sessions#destroy', as: :user_destroy_sessions

#   namespace :user do
#     get 'genres/index'
#     get 'genres/edit'
#     get 'sessions/new'
#     get 'sessions/create'
#     get 'sessions/destroy'
#   end
#   namespace :user do
#     resources :customers
#   end

#   namespace :user do
#     get 'cart_items/index'
#   end
#   namespace :user do
#     get 'addresses/index'
#     get 'addresses/create'
#     get 'addresses/edit'
#     get 'addresses/update'
#     get 'addresses/destroy'
#   end


namespace :admin do

  resources :items
  resources :users
  resources :customers
  resources :genres
  delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
  resources :cart_items

  
  get "orders/confirmation" => "orders#confirmation"
  post "orders/confirmation" => "orders#confirmation"
   get "orders/completion" => "orders#completion"

 resources :orders
end
  # resources :genres, only: [:index, :create, :update, :edit]
#   get 'order_items/update'

#   resources :sessions
#   get 'addresses/index'
#   get 'addresses/edit'
#   get 'addresses/create'
#   get 'addresses/update'
#   get 'addresses/destroy'
#   get 'registrations/new'
#   get 'registrations/create'


#   scope module: :admin do
#     delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
#     resources :cart_items, only: [:destroy,:index,:update,:create]

#     end

#   resources :customers, only: [:index, :create, :update, :edit, :new,]
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


# end


#   resources :genres, only: [:index, :create, :update, :edit]
#   get 'order_items/update'

#   get 'sessions/new'
#   get 'sessions/create'
#   get 'sessions/destroy'
#   get 'addresses/index'
#   get 'addresses/edit'
#   get 'addresses/create'
#   get 'addresses/update'
#   get 'addresses/destroy'

#   get 'registrations/new'
#   get 'registrations/create'

#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
  # URL /customers/sign_in ...
  # devise_for :user, skip: [:regustrations, :passwords], path: :user, controllers: {
  #   registrations: "user/registrations",
  #   sessions: 'user/sessions'
  # }
  devise_scope :user do
end



  get 'admin', to: 'admin/homes#top', as: 'admin_root'
  devise_for :admins,
    path: 'admin',
    controllers: {
      sessions: 'admin/admins/sessions'
    }
#  devise_scope :admin do
#    get 'admin/sign_in', to: 'admin/admins/sessions#new', as: :admin_new_sessions
#    match 'admin/sign_in', to: 'admin/admins/sessions#create', via: :post, as: :admin_sessions
#delete 'admin/sign_out', to: 'admin/admins/sessions#destroy', as: :admin_destroy_sessions
#  end
end


