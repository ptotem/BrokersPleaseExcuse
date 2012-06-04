BPEv075::Application.routes.draw do

  match 'property/(:building_id)/new', :to => "buildings#new", :as => "new_property"
  match 'building/:building_id/flat/:id/edit', :to => "buildings#edit", :as => "edit_property"


  resources :interaction_entities
  resources :taskings
  resources :interactions
  resources :interaction_types
  resources :contacts
  resources :connections
  resources :buildings
  resources :flats
  resources :tasks

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "welcome/index"

  devise_for :users

  match "get_contact_list"=>"buildings#get_contact_list"
  match "save_photo_positions"=>"buildings#save_photo_positions"
  match "update_photo_sequence"=>"buildings#update_photo_sequence"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
