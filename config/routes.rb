 Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :admins, controllers: { sessions: "admins/sessions" }
  namespace :admins do
    resources :products
  end

  get 'index' => 'products#index'
  get 'login' => 'sessions#new'
  get '/admins/destroy/:id' => 'admins/products#destroy', as: 'destroy_product'
  patch "/admins/products/:id/edit"=>'admins/products#edit'


  get 'category/:id' => 'category#show'
  get 'products/:id' => 'products#show'

  get 'cart_products' => 'cart_products#add'
  get 'cart_product/remove' => 'cart_products#remove'
  get 'cart_product/update' => 'cart_products#update'
  get 'cart_product/clear' => 'cart_products#clear'
  get 'cart' => 'carts#info'
  get 'carts' => 'cart_products#index'
  get 'carts/show' =>'carts#show'
  post 'carts/create' => 'carts#create', as: 'create_cart'

  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :carts, only: [:info,:destroy]
  resources :cart_products, only: [:new, :edit, :update, :index]
  root "products#index"
  # get 'cate/:id' => 'cacate#show'
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
