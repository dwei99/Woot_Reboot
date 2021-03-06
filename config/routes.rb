Rails.application.routes.draw do
  resources :charges

  root 'items#index'

  get '/add_item' => 'items#add_item'

  post '/items/create_item' =>'items#create_item'

  post '/items/create_category' =>'items#create_category'

  get '/add_category' => 'items#add_category'

  post '/items/:item_id/create_review' => 'items#create_review'

  get 'items/checkout/:id' => 'items#checkout'

  get 'items/show_item/:id' => 'items#show_item'

  get 'items/discussion/:id' => "items#show_discussion"

  post 'items/:item_id/create_post' => 'items#create_post'

  get '/category/show/:id' => "items#show_category"

  get 'users/index'

  get 'users/edit/:id' => "users#edit"

  post 'users/edit_acct/:id' => "users#edit_acct"

  post '/users/add_address' => "users#add_address"

  post 'users/create' => "users#create"

  post 'users/log_user' => 'users#log_user'

  get '/login' => 'users#login'

  get 'users/logout'

  get 'users/edit'

  get '/logout' => 'users#logout'

  post '/add_to_cart/:id' => 'items#add_to_cart'

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
