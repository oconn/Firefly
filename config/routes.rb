Firefly::Application.routes.draw do
  root 'static_pages#index'

  devise_for :photographers
  devise_for :users

  resources :posts do 
    resources :comments
  end

  resources :blog_images
  
  resources :tags

  resources :photographers

  resources :portfolio_images

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

  resources :contacts, :only => [:new, :create] do
    get 'thank_you', :on => :collection
  end


  match "/admin", to: "admins#index", via: :get, as: "admin"

  match "/block_user/:post_id/:id", to: "comments#block_user", via: :post, as: "block_user"

  match "/profile_image/:id", to: "users#edit_profile_image",   via: :get,  as: "profile_image"
  match "/profile_image/:id", to: "users#update_profile_image", via: :post

  match "/photographer_profile_image/:id", to: "photographers#edit_profile_image",   via: :get,  as: "photographer_profile_image"
  match "/photographer_profile_image/:id", to: "photographers#update_profile_image", via: :post
  
  match "/about_leah", to: "static_pages#about", via: :get, as: "about"
  match "/details", to: "static_pages#details", via: :get, as: "details"

  # Sitemap
  match '/sitemap1.xml.gz',  to: 'sitemaps#show', via: 'get'
end
