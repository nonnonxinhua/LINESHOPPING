Rails.application.routes.draw do
  get 'order_items/update'
  get 'genres/index'
  get 'genres/create'
  get 'genres/edit'
  get 'genres/update'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'orders/new'
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/create'
  get 'registrations/new'
  get 'registrations/create'
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/show'
  get 'items/new'
  get 'items/create'
  get 'items/edit'
  get 'items/update'
  get 'items/index'
  get 'items/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   get 'top' => 'homes#top'
   
end
