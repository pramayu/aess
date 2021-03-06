Rails.application.routes.draw do



  get 'password_resets/new'

  get 'password_resets/edit'

  resources :users
  resources :categories
  resources :events
  resources :testimonis
  resources :sliders
  resources :news
  resources :contacts, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :update, :edit]
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/event', to: 'home#event', as: :home_event
  get '/contact', to: 'home#contact', as: :home_contact
  get '/about', to: 'home#about', as: :home_about
  get '/client-says', to: 'home#testimonials', as: :home_testimo
  get '/event/:id', to: 'home#gallery', as: :category_event
  get 'admin/dashboard', to: 'admins#dashboard', as: :dashboard
  get 'admin/events', to: 'events#all_event', as: :all_event
  get 'admin/sliders', to: 'sliders#all_slider', as: :all_slider
  get 'admin/testimonials', to: 'testimonis#all_testimoni', as: :all_testimoni
  get 'admin/users/', to: 'users#all_user', as: :all_user
  get 'admin/announcements/', to: 'news#all_news', as: :all_news
  get 'admin/users/change-password/:id', to: 'users#edit_password', as: :edit_password
  get 'admin/categories', to: 'categories#all_category', as: :all_category
  delete '/events/:event_id/galleries/:id', to: 'galleries#delt', as: :delete_gallery
  root 'home#index'

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
