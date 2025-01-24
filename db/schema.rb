# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180718064807) do

  create_table "activity_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "note"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_notes_on_bill_id"
  end

  create_table "bill_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.date "date"
    t.date "eta"
    t.bigint "vendor_id"
    t.bigint "bill_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_term_id"
    t.bigint "order_id"
    t.index ["bill_status_id"], name: "index_bills_on_bill_status_id"
    t.index ["order_id"], name: "index_bills_on_order_id"
    t.index ["vendor_id"], name: "index_bills_on_vendor_id"
    t.index ["vendor_term_id"], name: "index_bills_on_vendor_term_id"
  end

  create_table "child_preferences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_preference_group_id"
    t.string "controller_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_preference_group_id"], name: "index_child_preferences_on_user_preference_group_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "state_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "address"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.string "pin_code"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "url"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["country_id"], name: "index_companies_on_country_id"
    t.index ["state_id"], name: "index_companies_on_state_id"
  end

  create_table "company_defaults", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "activity_type_id"
    t.float "sales_tax_rate", limit: 24
    t.bigint "customer_shipping_id"
    t.float "shipping_charge", limit: 24
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_company_defaults_on_activity_type_id"
    t.index ["company_id"], name: "index_company_defaults_on_company_id"
    t.index ["customer_shipping_id"], name: "index_company_defaults_on_customer_shipping_id"
  end

  create_table "company_rate_factors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "label"
    t.string "day"
    t.string "factor"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_rate_factors_on_company_id"
  end

  create_table "contact_method_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone_code"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sortname"
    t.integer "school_id"
  end

  create_table "credit_card_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "card_number"
    t.string "date"
    t.integer "card_cvc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_payment_id"
    t.index ["order_payment_id"], name: "index_credit_card_details_on_order_payment_id"
  end

  create_table "customer_contact_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "contact_method_type_id"
    t.string "phone"
    t.string "email"
    t.boolean "is_primary", default: false
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_method_type_id"], name: "index_customer_contact_methods_on_contact_method_type_id"
    t.index ["customer_id"], name: "index_customer_contact_methods_on_customer_id"
  end

  create_table "customer_documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "document_type_id"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_customer_documents_on_customer_id"
    t.index ["document_type_id"], name: "index_customer_documents_on_document_type_id"
  end

  create_table "customer_insurances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider"
    t.float "coverage", limit: 24
    t.date "expired_by"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.string "zipcode"
    t.string "telephone"
    t.string "fax"
    t.string "email"
    t.boolean "insured", default: false
    t.index ["city_id"], name: "index_customer_insurances_on_city_id"
    t.index ["country_id"], name: "index_customer_insurances_on_country_id"
    t.index ["customer_id"], name: "index_customer_insurances_on_customer_id"
    t.index ["state_id"], name: "index_customer_insurances_on_state_id"
  end

  create_table "customer_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "attn"
    t.text "address_line_1"
    t.text "address_line_2"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.string "phone"
    t.string "landmark"
    t.boolean "is_primary", default: false
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
    t.index ["city_id"], name: "index_customer_locations_on_city_id"
    t.index ["country_id"], name: "index_customer_locations_on_country_id"
    t.index ["customer_id"], name: "index_customer_locations_on_customer_id"
    t.index ["state_id"], name: "index_customer_locations_on_state_id"
  end

  create_table "customer_related_notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "note"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_related_notes_on_customer_id"
  end

  create_table "customer_shippings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "url"
    t.bigint "customer_type_id"
    t.bigint "customer_term_id"
    t.bigint "customer_source_id"
    t.bigint "customer_shipping_id"
    t.bigint "customer_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.boolean "active_status", default: true
    t.index ["customer_shipping_id"], name: "index_customers_on_customer_shipping_id"
    t.index ["customer_source_id"], name: "index_customers_on_customer_source_id"
    t.index ["customer_status_id"], name: "index_customers_on_customer_status_id"
    t.index ["customer_term_id"], name: "index_customers_on_customer_term_id"
    t.index ["customer_type_id"], name: "index_customers_on_customer_type_id"
  end

  create_table "document_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "barcode"
    t.bigint "serial_no"
    t.date "date"
    t.float "purchase_cost", limit: 24
    t.integer "depreciation_year"
    t.float "approx_value", limit: 24
    t.integer "year_placed_in_svc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "kit_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "quantity", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "available_quantity", limit: 24
  end

  create_table "order_bill_tos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_location_id"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["city_id"], name: "index_order_bill_tos_on_city_id"
    t.index ["country_id"], name: "index_order_bill_tos_on_country_id"
    t.index ["customer_location_id"], name: "index_order_bill_tos_on_customer_location_id"
    t.index ["order_id"], name: "index_order_bill_tos_on_order_id"
    t.index ["state_id"], name: "index_order_bill_tos_on_state_id"
  end

  create_table "order_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.string "filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_category_id"
    t.bigint "product_kind_category_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_category_id"], name: "index_order_items_on_product_category_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["product_kind_category_id"], name: "index_order_items_on_product_kind_category_id"
  end

  create_table "order_notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "note"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_notes_on_order_id"
  end

  create_table "order_payment_modes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "payment_mode"
    t.float "amount", limit: 24
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_payment_mode_id"
    t.index ["order_id"], name: "index_order_payments_on_order_id"
    t.index ["order_payment_mode_id"], name: "index_order_payments_on_order_payment_mode_id"
  end

  create_table "order_schedulings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "rental_prep"
    t.date "rental_picup"
    t.date "rental_return"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.boolean "status", default: true
    t.string "barcode"
    t.index ["order_id"], name: "index_order_schedulings_on_order_id"
    t.index ["product_id"], name: "index_order_schedulings_on_product_id"
  end

  create_table "order_ship_tos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_location_id"
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["city_id"], name: "index_order_ship_tos_on_city_id"
    t.index ["country_id"], name: "index_order_ship_tos_on_country_id"
    t.index ["customer_location_id"], name: "index_order_ship_tos_on_customer_location_id"
    t.index ["order_id"], name: "index_order_ship_tos_on_order_id"
    t.index ["state_id"], name: "index_order_ship_tos_on_state_id"
  end

  create_table "order_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_type_id"
    t.bigint "sales_person_id"
    t.date "date"
    t.string "cust_po"
    t.bigint "payment_term_id"
    t.bigint "order_status_id"
    t.bigint "number"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    t.index ["order_type_id"], name: "index_orders_on_order_type_id"
    t.index ["payment_term_id"], name: "index_orders_on_payment_term_id"
    t.index ["sales_person_id"], name: "index_orders_on_sales_person_id"
  end

  create_table "payment_terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_contact_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "contact_method_type_id"
    t.string "phone"
    t.string "email"
    t.boolean "is_primary", default: false
    t.bigint "people_contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_method_type_id"], name: "index_people_contact_methods_on_contact_method_type_id"
    t.index ["people_contact_id"], name: "index_people_contact_methods_on_people_contact_id"
  end

  create_table "people_contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "salutation"
    t.string "title"
    t.string "status"
    t.string "department"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_people_contacts_on_customer_id"
  end

  create_table "privilege_sets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_privilege_sets_on_user_id"
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_descriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "description"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_descriptions_on_product_id"
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_kind_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_kind_categories_on_product_id"
  end

  create_table "product_kit_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "kit_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "quantity", limit: 24
    t.index ["kit_item_id"], name: "index_product_kit_items_on_kit_item_id"
    t.index ["product_id"], name: "index_product_kit_items_on_product_id"
  end

  create_table "product_pricing_rents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "price", limit: 24
    t.bigint "product_rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_rental_id"], name: "index_product_pricing_rents_on_product_rental_id"
  end

  create_table "product_pricings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cost"
    t.string "price"
    t.boolean "taxable"
    t.bigint "vendor_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sale_status", default: true
    t.index ["product_id"], name: "index_product_pricings_on_product_id"
    t.index ["vendor_id"], name: "index_product_pricings_on_vendor_id"
  end

  create_table "product_rentals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.float "day3", limit: 24
    t.float "day2", limit: 24
    t.float "day1", limit: 24
    t.float "depreciation_year", limit: 24
    t.float "estimated_rental_days_per_year", limit: 24
    t.float "estimated_daily_cost", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weekly", limit: 24
    t.index ["product_id"], name: "index_product_rentals_on_product_id"
  end

  create_table "product_sales", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.float "quantity_in_stock", limit: 24
    t.date "reorder_when_at_or_below"
    t.float "reorder_qty", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_sales_on_product_id"
  end

  create_table "product_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_track_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "track_barcode_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_track_codes_on_product_id"
    t.index ["track_barcode_id"], name: "index_product_track_codes_on_track_barcode_id"
  end

  create_table "product_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "manufacturer"
    t.string "name"
    t.string "barcode"
    t.bigint "product_type_id"
    t.bigint "product_category_id"
    t.bigint "product_status_id"
    t.boolean "is_kit", default: false
    t.boolean "track_barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kit_item_id"
    t.bigint "product_kind_category_id"
    t.string "rental_sale"
    t.index ["kit_item_id"], name: "index_products_on_kit_item_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_kind_category_id"], name: "index_products_on_product_kind_category_id"
    t.index ["product_status_id"], name: "index_products_on_product_status_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "receiving_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "receiving_id"
    t.float "fine", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_receiving_products_on_order_id"
    t.index ["product_id"], name: "index_receiving_products_on_product_id"
    t.index ["receiving_id"], name: "index_receiving_products_on_receiving_id"
  end

  create_table "receivings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "received_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "country_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "track_barcodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "barcode"
    t.bigint "serial_no"
    t.date "date"
    t.float "purchase_cost", limit: 24
    t.integer "depreciation_year"
    t.float "approx_value", limit: 24
    t.integer "year_placed_in_svc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "account_name"
    t.string "display_name"
    t.boolean "is_sales_person"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "privilege_set"
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "user_preference_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendor_contact_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "contact_method_type"
    t.string "phone"
    t.string "email"
    t.boolean "is_primary", default: false
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_vendor_contact_methods_on_vendor_id"
  end

  create_table "vendor_documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "document_type_id"
    t.string "document_file_file_name"
    t.string "document_file_content_type"
    t.integer "document_file_file_size"
    t.datetime "document_file_updated_at"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_vendor_documents_on_document_type_id"
    t.index ["vendor_id"], name: "index_vendor_documents_on_vendor_id"
  end

  create_table "vendor_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "vendor_person_id"
    t.text "address_1"
    t.text "address_2"
    t.bigint "country_id"
    t.bigint "city_id"
    t.bigint "state_id"
    t.string "phone"
    t.boolean "is_primary"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
    t.index ["city_id"], name: "index_vendor_locations_on_city_id"
    t.index ["country_id"], name: "index_vendor_locations_on_country_id"
    t.index ["state_id"], name: "index_vendor_locations_on_state_id"
    t.index ["vendor_id"], name: "index_vendor_locations_on_vendor_id"
    t.index ["vendor_person_id"], name: "index_vendor_locations_on_vendor_person_id"
  end

  create_table "vendor_notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "note"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_vendor_notes_on_vendor_id"
  end

  create_table "vendor_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "salutation"
    t.string "title"
    t.string "status"
    t.string "department"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_vendor_people_on_vendor_id"
  end

  create_table "vendor_people_contact_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "contact_method_type"
    t.string "phone"
    t.string "email"
    t.boolean "is_primary", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_person_id"
    t.index ["vendor_person_id"], name: "index_vendor_people_contact_methods_on_vendor_person_id"
  end

  create_table "vendor_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "url"
    t.bigint "vendor_type_id"
    t.bigint "vendor_term_id"
    t.bigint "vendor_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_status_id"], name: "index_vendors_on_vendor_status_id"
    t.index ["vendor_term_id"], name: "index_vendors_on_vendor_term_id"
    t.index ["vendor_type_id"], name: "index_vendors_on_vendor_type_id"
  end

  add_foreign_key "bill_notes", "bills"
  add_foreign_key "bills", "bill_statuses"
  add_foreign_key "bills", "orders"
  add_foreign_key "bills", "vendor_terms"
  add_foreign_key "bills", "vendors"
  add_foreign_key "child_preferences", "user_preference_groups"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "countries"
  add_foreign_key "companies", "states"
  add_foreign_key "company_defaults", "activity_types"
  add_foreign_key "company_defaults", "companies"
  add_foreign_key "company_defaults", "customer_shippings"
  add_foreign_key "company_rate_factors", "companies"
  add_foreign_key "credit_card_details", "order_payments"
  add_foreign_key "customer_contact_methods", "contact_method_types"
  add_foreign_key "customer_contact_methods", "customers"
  add_foreign_key "customer_documents", "customers"
  add_foreign_key "customer_documents", "document_types"
  add_foreign_key "customer_insurances", "cities"
  add_foreign_key "customer_insurances", "countries"
  add_foreign_key "customer_insurances", "customers"
  add_foreign_key "customer_insurances", "states"
  add_foreign_key "customer_locations", "cities"
  add_foreign_key "customer_locations", "countries"
  add_foreign_key "customer_locations", "customers"
  add_foreign_key "customer_locations", "states"
  add_foreign_key "customer_related_notes", "customers"
  add_foreign_key "customers", "customer_shippings"
  add_foreign_key "customers", "customer_sources"
  add_foreign_key "customers", "customer_statuses"
  add_foreign_key "customers", "customer_terms"
  add_foreign_key "customers", "customer_types"
  add_foreign_key "inventories", "products"
  add_foreign_key "order_bill_tos", "cities"
  add_foreign_key "order_bill_tos", "countries"
  add_foreign_key "order_bill_tos", "customer_locations"
  add_foreign_key "order_bill_tos", "orders"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_categories"
  add_foreign_key "order_items", "product_kind_categories"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_notes", "orders"
  add_foreign_key "order_payments", "order_payment_modes"
  add_foreign_key "order_payments", "orders"
  add_foreign_key "order_schedulings", "orders"
  add_foreign_key "order_schedulings", "products"
  add_foreign_key "order_ship_tos", "cities"
  add_foreign_key "order_ship_tos", "countries"
  add_foreign_key "order_ship_tos", "customer_locations"
  add_foreign_key "order_ship_tos", "orders"
  add_foreign_key "order_ship_tos", "states"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "order_types"
  add_foreign_key "orders", "payment_terms"
  add_foreign_key "orders", "sales_people"
  add_foreign_key "people_contact_methods", "contact_method_types"
  add_foreign_key "people_contact_methods", "people_contacts"
  add_foreign_key "people_contacts", "customers"
  add_foreign_key "privilege_sets", "users"
  add_foreign_key "product_descriptions", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_kind_categories", "products"
  add_foreign_key "product_kit_items", "kit_items"
  add_foreign_key "product_kit_items", "products"
  add_foreign_key "product_pricing_rents", "product_rentals"
  add_foreign_key "product_pricings", "products"
  add_foreign_key "product_pricings", "vendors"
  add_foreign_key "product_rentals", "products"
  add_foreign_key "product_sales", "products"
  add_foreign_key "product_track_codes", "products"
  add_foreign_key "product_track_codes", "track_barcodes"
  add_foreign_key "products", "kit_items"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_kind_categories"
  add_foreign_key "products", "product_statuses"
  add_foreign_key "products", "product_types"
  add_foreign_key "receiving_products", "orders"
  add_foreign_key "receiving_products", "products"
  add_foreign_key "receiving_products", "receivings"
  add_foreign_key "states", "countries"
  add_foreign_key "user_infos", "users"
  add_foreign_key "vendor_contact_methods", "vendors"
  add_foreign_key "vendor_documents", "document_types"
  add_foreign_key "vendor_documents", "vendors"
  add_foreign_key "vendor_locations", "cities"
  add_foreign_key "vendor_locations", "countries"
  add_foreign_key "vendor_locations", "states"
  add_foreign_key "vendor_locations", "vendor_people"
  add_foreign_key "vendor_locations", "vendors"
  add_foreign_key "vendor_notes", "vendors"
  add_foreign_key "vendor_people", "vendors"
  add_foreign_key "vendor_people_contact_methods", "vendor_people"
  add_foreign_key "vendors", "vendor_statuses"
  add_foreign_key "vendors", "vendor_terms"
  add_foreign_key "vendors", "vendor_types"
end
