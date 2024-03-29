Wow::Application.routes.draw do
  resources :feedbacks

  resources :spendings
  resources :posts do
    resources :comments, shallow: true
  end
  get 'transactions/:transaction_id/add_details' => 'transactions#add_details', :as => 'add_details_transaction'
  get 'transactions/:transaction_id/edit_details' => 'transactions#edit_details', :as => 'edit_details_transaction'
  post 'transactions/:transaction_id/save_details' => 'transactions#save_details', :as => 'save_details_transaction'
  post 'transactions/:transaction_id/update_details' => 'transactions#update_details', :as => 'update_details_transaction'
  get '/tmp_test', to: 'tmp_test#index'

  resources :transactions do
    resources :spendings
  end

  resources :people

  resources :event_accesses

  resources :events do
    resources :people
    resources :transactions
  end

  devise_for :users
  root 'welcome#index'
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
