IcodeUni::Application.routes.draw do
  

  resources :fitting_materials do 
    get :autocomplete_fitting_material_name, :on => :collection
  end

  resources :history_file_deletes

  resources :price_controls do
    #get :autocomplete_price_control_reference, :on => :collection
  end

  resources :price_control_items do
    #match 'search' => 'price_control#search', :via => [:get, :post], :as => :search
    get :autocomplete_material_material_code, :on => :collection
    collection do
      get "edit_price"
      post "update_edit_price"
      get "add_raw_group_price"
      get "add_fitting_group_price"
      post "create_raw_fitting"
    end
    #get :autocomplete_price_control_items_custom_name , :on => :collection
  end

  get "home/testing_kendoi"
  resources :projects do
      get :autocomplete_project_name, :on => :collection
    member do
      get "project_station"
      # get "project_estimation"
    end
    collection do
      get "project_estimation"
      get "list_non_standard_project"
      get "list_project_estimation"
      get "list_standard_project"
    end
  end


  resources :fomulations

  resources :estimations do
    get :autocomplete_estimation_title, :on => :collection
    collection do
      get "station_estimation"
      get "standard_project_estimation"
      get "standard_estimation"
      get "estimation_deck"
      # new standard estimation path
      get "project_estimation_list"
      get "non_standard_estimation"
    end
  end
  
  resources :spreadsheets do
    collection do
      get "read_material_file"
      post "save_material_file"
      get "read_client_file"
      post "save_client_file"
      get "read_fitting_material_file"
      post "save_fitting_material_file"
    end
  end

  resources :estimation_items do
    get :autocomplete_fitting_material_material_code, :on => :collection
    get :autocomplete_fitting_material_name, :on => :collection
    get :autocomplete_fitting_material_remark, :on => :collection
    get :autocomplete_material_material_code, :on => :collection
    get :autocomplete_material_dimension_w, :on => :collection
    get :autocomplete_material_name, :on => :collection
    collection do
      get "standard_estimation_item"
    end
  end

  resources :stations do
      get :autocomplete_project_name, :on => :collection
    member do
      get "standard_station"
      get "edit_estimation"
    end
    collection do
      match 'search' => 'stations#search', :via => [:get, :post], :as => :search
      get "list_standard_station"  
      get "standard_station_estimation"
    end
  end
 

  resources :materials do
    get :autocomplete_material_material_code, :on => :collection
    member do
      get "estimation_item"
    end
  end

  resources :drawings do
    collection do
      get "pdf_drawing_pic"
    end
  end

  resources :clients do
    get :autocomplete_client_name, :on => :collection
  end

  get "home/index"
  get "home/test"

  match '/:id' => "shortener/shortened_urls#show", via: [:get]

  devise_for :users #, :controllers => {:registrations => "registrations"}
  resources :users do
    get :autocomplete_user_username, :on => :collection
    member do      
      get :edit_user      
      patch :update_user    
    end
    collection do
      get :new_user       
      post :create_user
    end       
  end

    resources :roles  

    resources :reports do
      get :autocomplete_station_name, :on => :collection
      collection do
        get :pdf_estimation_report
        get :list_estimation_report
        get :excel_estimation_report
        get :pdf_project_report
        get :list_project_report
        get :excel_project_report
      end
    end


    # resources :reports do
    #   get :estimation, :on => :collection
    # end

  # devise_for :admins
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => "home#index"

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
