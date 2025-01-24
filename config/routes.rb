Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: 'home/index'
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions",registrations: "users/registrations",  passwords: "users/passwords"}
  root :to=> 'dashboards#dashboard'

  resources :homes do
    collection do
      get :preferences
      get :reports
      get :receiving
      get :recvng
      get :recent
      get :posbills
      # get :orders_list
      get :bills
      get :bills_list

      get :recvform
      get :bill_forms
      get :home
      get :edit_user_form
      get :orders
      get :dashboard
    end
  end
  #dashboard routes
  resources :dashboards do
    collection do
      get :dashboard
    end
  end

  #sales people routes
  resources :sales_people do
    collection do
      get :all_sales_person
    end
  end

  #order_types_routes
  resources :order_types do
    collection do
      get :all_order_type
    end
  end

  #payment terms routes
  resource :payment_terms do
    collection do
      get :all_payment_term
    end
  end

  #product kit item 
  resources :kit_items do
    collection do 
      get :all_kit_item
    end
  end

  #order status routes
  resources :order_statuses do
    collection do
      get :all_order_status
    end
  end

  #order status routes
  resources :order_payment_modes do
    collection do
      get :get_order_payment_mode
    end
  end

  #Product track barcode
  resources :track_barcodes do 
    collection do
      get :all_track_barcode
    end
  end

  resources :orders do
    collection do
      get :check_product_availability
      get :orders_list
      get :orders_list_details
      get :get_order_types
      get :get_order_salespeople
      get :get_order_payment_terms
      get :get_order_statuses
      get :order_item_list
      get :get_product_list
      get :get_description_image
      get :get_customers
      get :get_order_scheduling
      get :barcode_search
      get :shopify_order_lists
      get :rental_picup_date
      get :item_calenders
      get :product_kind_category
    end
  end
  
  resources :vendors do
    collection do
      get :vendor_list
      get :get_vendor_types
      get :get_vendor_terms
      get :get_vendor_status
      get :get_vendor_document_types
      get :get_state
      get :get_city
    end
  end

  resources :vendor_types do 
    collection do 
      get :all_vendor_type
    end
  end

  resources :vendor_terms do 
    collection do 
      get :all_vendor_term
    end
  end

  resources :vendor_statuses do 
    collection do 
      get :all_vendor_status
    end
  end
  
  resources :customer_types do
    collection do
      get :all_customer_type
    end
  end

  resources :customer_terms do 
    collection do 
      get :all_customer_term
    end
  end

  resources :customer_sources do 
    collection do 
      get :all_customer_source
    end
  end

  resources :customer_shippings do 
    collection do 
      get :all_customer_shipping
    end
  end

  resources :customer_statuses do 
    collection do 
      get :all_customer_status
    end
  end

  resources :contact_method_types do 
    collection do 
      get :all_customer_contact_method_type
    end
  end

  resources :document_types do
    collection do
      get :all_customer_document_type
    end
  end

  resources :cities do
    collection do
      get :all_cities
    end
    member do 
      get :get_all_city_by_state
    end  
  end

  resources :customers do
    member do
      get :delete_customer
    end
    collection do
      get :customers_list
      get :get_customer_types
      get :get_customer_terms
      get :get_customer_sources
      get :get_customer_shippings
      get :get_customer_documents_types
      get :get_state
      get :get_city
      get :get_customer_status
      get :get_customer_method_types
      get :get_customer_addrs
      get :get_customer_new_addrs
      get :get_customer_ships
      get :get_customer_new_ships
    end
  end
  resources :products do
    collection do
      get :products_list
      get :shopify_product_lists
      get :get_product_types
      get :get_product_categories
      get :get_product_statuses
      get :get_product_item
      get :get_product_kit_item
      get :get_product_track_code
      get :get_product_kind_categories
      get :get_product_kind         
    end   
  end
  resources :product_types do 
    collection do 
      get :all_product_type
    end
  end

  resources :product_categories do 
    collection do 
      get :all_product_category
    end
  end

  resources :product_statuses do 
    collection do 
      get :all_product_status
    end
  end

  resources :homes
  
  resources :companies do
    collection do
      get :get_activity_types
      get :company_list
      get :get_state
      get :get_city
    end
  end

  resources :users do
    collection do
      get :user_list
      get :user_preference
      post :create_user_by_admin
    end
    member do 
      patch :edit_user_by_admin
    end
  end

  resources :activity_types do 
    collection do 
      get :all_activity_type
    end
  end
  
  resources :bills do
    member do
      get :get_genarate_bill
    end
    collection do
      get :bills_list
      get :get_bill_status
      get :get_vendors
    end
  end

  resources :bill_statuses do 
    collection do 
      get :all_bill_status
    end
  end

  resources :receivings do
    member do
      get :get_received_receipt
    end
    collection do
      get :receiving_list
      get :recent_inventory_list
      get :pos_bills_list
      get :product_received
      get :barcode_search_receiving
      # get :your_other_product_list
    end
  end
  
  resources :rental_settings do
    collection do
      get :add_rental_settings
    end
  end

  #user preference group
  resources :user_preference_groups do
  end
  # resources :vendor_list_vendors
end