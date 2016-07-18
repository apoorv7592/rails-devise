require 'resque/server'
Rails.application.routes.draw do

    get "logout" => "sessions#destroy", :as => "logout"
    post "login" => "sessions#create", :as => "login"
    get "sign_new" => "users#new", :as => "sign_new"
    post "sign_up" => "users#create", :as => "sign_up"
    resources :users
    resources :sessions

  
  mount Resque::Server.new, :at => "/resque"
    post 'orders/cancelled/:id' =>'orders#cancelled'
    get 'addresses/get_user_address/:id' =>'addresses#get_user_address'
    post 'coupons/check_coupon' => 'coupons/check_coupon'
  
    resources :homes
    resources :addresses
    resources :invoices
    resources :orders
    resources :coupons
    resources :order_products
    resources :order_processes
    root 'welcome#index'
    resources :categories do
      collection { post :import }
    end

    resources :companies
    resources :products do
      collection do
        get :search
      end
    end

    resources :product_sizes




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
