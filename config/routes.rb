Rails.application.routes.draw do


  get 'favorites/index'

  devise_for :users, path: '', :controllers => {:registrations => "registrations"}
  root 'demo_page#index'
  post ':user_id/favorites/:post_id', to: 'favorites#create', as: :new_favorite
  delete ':user_id/favorites/:post_id', to: 'favorites#destroy', as: :delete_favorite
  get ':user_id/favorites', to: 'favorites#index', as: :favorites
  resource :profile, only: [:show]
  resource :path, only: [:show]
  resource :map , only: [:show]
  resource :activites, only: [:show]
  resource :progress, only: [:show]
  resources :tags, only: [:index, :show]
  resource :setting, only: [:show]
  resource :invite, path: 'users', only: [:show]
  resources :posts, only: [:index, :new, :update, :create]
  resources :users, :only => [:show, :update], path: '' do
    resources :relationships, only: [:create, :destroy]
    member do 
      get :following, :followers
    end
    resources :posts, path: '', only: [:show, :destroy, :edit] do
      resources :comments, only: [:create]
    end
  end
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
