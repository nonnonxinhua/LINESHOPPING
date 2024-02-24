Rails.application.routes.draw do
  root 'user/homes#top'
  namespace :user do
    root 'homes#top'
#     resources :items

#     get 'top' => 'homes#top'

#     scope module: :user do
#     delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
#     resources :cart_items, only: [:destroy,:index,:update,:create]

#     end
  end

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
  root 'homes#top'
end
  # resources :genres, only: [:index, :create, :update, :edit]
#   get 'order_items/update'

#   resources :sessions
#   resources :cart_items
#   get 'addresses/index'
#   get 'addresses/edit'
#   get 'addresses/create'
#   get 'addresses/update'
#   get 'addresses/destroy'
#   get 'orders/new'
#   get 'orders/create'
#   get 'orders/index'
#   get 'orders/show'
#   get 'registrations/new'
#   get 'registrations/create'


#   scope module: :admin do
#     delete 'cart_items/destroy_all' =>"cart_items#destroy_all"
#     resources :cart_items, only: [:destroy,:index,:update,:create]

#     end

#   resources :customers, only: [:index, :create, :update, :edit, :new,]
#   resources :items
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   get 'top' => 'homes#top'


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
#   get 'orders/new'
#   get 'orders/create'
#   get 'orders/index'
#   get 'orders/show'


#   get 'registrations/new'
#   get 'registrations/create'
#   get 'customers/index'
#   get 'customers/show'
#   get 'customers/edit'
#   get 'customers/update'
#   get 'customers/show'
#   get 'items/new'
#   get 'items/create'
#   get 'items/edit'
#   get 'items/update'
#   get 'items/index'
#   get 'items/show'
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   get 'top' => 'homes#top'
  
  # 顧客用
  # URL /customers/sign_in ...
  # devise_for :user, skip: [:regustrations, :passwords], path: :user, controllers: {
  #   registrations: "user/registrations",
  #   sessions: 'user/sessions'
  # }
  devise_scope :user do
    devise_for :users, path: "user"
    get 'user/sign_in', to: 'user/users/sessions#new', as: :user_new_sessions
    match 'user/sign_in', to: 'user/users/sessions#create', via: :post, as: :user_sessions
    delete 'user/sign_out', to: 'user/users/sessions#destroy', as: :user_destroy_sessions
  end
  
  
  # 管理者用
  # URL /admin/sign_in ...
  # devise_for :admin, skip: [:registrations, :passwords], path: :admin, controllers: {
  #   sessions: "admin/sessions"
  # }
  devise_scope :admin do
    devise_for :admins, path: "admin"
    get 'admin/sign_in', to: 'admin/admins/sessions#new', as: :admin_new_sessions
    match 'admin/sign_in', to: 'admin/admins/sessions#create', via: :post, as: :admin_sessions
    delete 'admin/sign_out', to: 'admin/admins/sessions#destroy', as: :admin_destroy_sessions
  end
end


