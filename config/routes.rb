Firefly::Application.routes.draw do
  root 'static_pages#index'

  devise_for :photographers
  devise_for :users

  resources :posts do 
    resources :comments
  end
  resources :tags

  resources :photographers

  match "/calendars/:photographer_id", to: "calendars#create", via: :post, as: "add_calendar"
  match "/calendars/update/:id", to: "calendars#update", via: :post, as: "update_calendar"
  resources :users, shallow: true do 
    member do 
      get 'email'
      post 'email', to: "users#send_email"
    end
    resources :galleries do 
      resources :images
    end
  end


  match "/admin", to: "admins#index", via: :get, as: "admin"

  match "/block_user/:post_id/:id", to: "comments#block_user", via: :post, as: "block_user"

  match "/profile_image/:id", to: "users#edit_profile_image",   via: :get,  as: "profile_image"
  match "/profile_image/:id", to: "users#update_profile_image", via: :post

  match "/photographer_profile_image/:id", to: "photographers#edit_profile_image",   via: :get,  as: "photographer_profile_image"
  match "/photographer_profile_image/:id", to: "photographers#update_profile_image", via: :post


  
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
