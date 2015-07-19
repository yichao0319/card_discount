Rails.application.routes.draw do
  ## login functions by devise
  devise_for :users
  
  ## additional controller users for profile editing
  get 'profile/show' => 'users#show', as: 'show_profile'
  get 'profile/edit' => 'users#edit', as: 'edit_profile'
  match 'profile/update' => 'users#update', as: 'update_profile', via: [:patch]

  ## admin pages
  get 'admin/list_users' => 'admin#list_users', as: 'admin_list_users'
  get 'admin/show_user' => 'admin#show_user', as: 'admin_show_user'
  get 'admin/edit_user/:id' => 'admin#edit_user', as: 'admin_edit_user'
  match 'admin/update_user/:id' => 'admin#update_user', as: 'admin_update_user', via: [:patch]
  match 'admin/delete_user/:id' => 'admin#delete_user', as: 'admin_delete_user', via: [:delete]

  ## wallet
  resources :wallets

  ## store & group
  resources :groups do
    member do
      get 'logo'
    end
  end

  resources :store_infos do
    resources :tags
    resources :store_info_ratings

    member do
      get 'logo'
    end
  end

  ## bank & card
  resources :agents
  resources :card_types
  resources :card_levels
  resources :banks
  resources :cards do
    resources :tags
    resources :card_ratings
  end

  ## discount
  resources :discounts do
    resources :tags
    resources :discount_ratings
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'user#index'

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

  root to: "welcome#index"
end
