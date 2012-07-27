BPEv075::Application.routes.draw do

  resources :deals

  resources :deal_stages

  match 'property/(:building_id)/quick_form', :to => "buildings#quick_form", :as => "new_property"
  match 'building/:building_id/flat/:id/detailed_form/basic', :to => "buildings#detailed_form", :as => "edit_property_basic"
  match 'building/:building_id/flat/:id/detailed_form/location', :to => "buildings#building_location", :as => "edit_property_location"
  match 'building/:building_id/flat/:id/detailed_form/building_features', :to => "buildings#building_features", :as => "edit_property_building_features"
  match 'building/:building_id/flat/:id/detailed_form/flat_features', :to => "buildings#flat_features", :as => "edit_property_flat_features"
  match 'building/:building_id/flat/:id/detailed_form/photos', :to => "buildings#photos", :as => "edit_property_flat_photos"
  match 'building/:building_id/flat/:id/detailed_form/tag_photos', :to => "buildings#tag_photos", :as => "tag_property_flat_photos"
  match 'building/:building_id/flat/:id/detailed_form/moreinfo', :to => "buildings#moreinfo", :as => "edit_property_flat_moreinfo"
  match 'building/:building_id/flat/:id/detailed_form/terms', :to => "buildings#terms", :as => "edit_property_terms"
  match 'property/:id', :to => "flats#show", :as => "show_property"

  match 'property/notes/:building_id/:flat_id',:to=>"flats#notes",:as=>"notes"


  resources :interaction_entities
  resources :taskings
  resources :interactions
  resources :interaction_types
  resources :contacts
  resources :connections
  resources :buildings
  resources :flats
  resources :tasks
  resources :photos
  resources :building_services
  resources :pois


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "welcome/index"

  devise_for :users

  match "get_contact_list" => "buildings#get_contact_list"


  match "rename_photo/:photo_id" => "photos#rename_photo", :as => "rename_photo"
  match "delete_all_photos/:flat_id" => "photos#delete_all_photos", :as => "delete_all_photos"
  match "make_showcase_image/:flat_id/:photo_id" => "photos#make_showcase_image", :as => "make_showcase_image"
  match "update_photo_sequence" => "photos#update_photo_sequence", :as => "update_photo_sequence"
  match "save_photo_positions/:photo_id/:xpos/:ypos"=>"photos#save_photo_positions",:as=>"save_photo_positions"
  match "make_floor_plan/:flat_id/:photo_id"=>"photos#make_floor_plan",:as=>"make_floor_plan"

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
