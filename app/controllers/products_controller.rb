class ProductsController < ApplicationController
	before_action :shopify_product_auth, only: [:shopify_product_lists]
	def shopify_product_lists
		@shopify_all_products = ShopifyAPI::Product.find(:all)
	end

	def products
		@all_general_product=Product.all
		@all_pricing=ProductPricing.all
		@all_product_image=ProductImage.all
		@all_product_description=ProductDescription.all
	end

     def get_product_kit_item
		if params[:kit_item_id].present?
			puts"============>>>>>>>>>>>> #{params[:kit_item_id]}"
		 kit_item=KitItem.where("id=?",params[:kit_item_id]).last
		if kit_item.available_quantity > 0
		 render :json => {:status => "In Stock",:quantity => kit_item.available_quantity} 
		 else	
		 render :json => {:status => "Not in Stock",:quantity => kit_item.available_quantity} 
        end
        end
      end

	def new
		@general_product=Product.new
		@product_type=ProductType.new
		@product_category=ProductCategory.new
		@product_status=ProductStatus.new
		@kit_item=KitItem.new
		@track_barcode=TrackBarcode.new
		@all_pricing=ProductPricing.all
		@all_general_vendor = Vendor.all
		@all_product_type=ProductType.all
		@all_product_category=ProductCategory.all
		@all_product_status=ProductStatus.all
		@all_product_country = Country.all
		@all_product_state = State.all
		@all_product_city = City.all	
		@last_product_image = Product.last
		@all_kit_item = KitItem.all
		@all_track_barcode=TrackBarcode.all
		@all_product_kind_category = ProductKindCategory.all
		@last_product = Product.last
	end

	def products_list
		@all_general_product = Product.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
		@all_kit_count=KitItem.count
	end

	def create
		@general_product = Product.new(params_general_product)
	    if@general_product.save
	    	flash[:success] = "New Product Created"
			redirect_to new_product_path
		else
			puts "#{@general_product.errors.full_messages.to_sentence}"
	 		flash[:error] = "New Product Not created"
			redirect_to  products_list_products_path
	    end
	end

	def edit
		@general_product=Product.find(params[:id])
		@all_product_type=ProductType.all
		@all_product_category=ProductCategory.all
		@all_general_vendor = Vendor.all
		@all_product_status=ProductStatus.all
		@all_product_country = Country.all
		@all_product_state = State.all
		@all_product_city = City.all
		@all_kit_item = KitItem.all
		@all_track_barcode=TrackBarcode.all
		@all_product_kind_category = ProductKindCategory.all
		
	end


	def show
		@general_product=Product.find(params[:id])
		@product_type=ProductType.new
		@product_category=ProductCategory.new
		@product_status=ProductStatus.new
		@kit_item=KitItem.new
		@all_product_type=ProductType.all
		@all_product_category=ProductCategory.all
		@all_general_vendor = Vendor.all
		@all_product_status=ProductStatus.all
		@all_product_country = Country.all
		@all_product_state = State.all
		@all_product_city = City.all
		@all_kit_item = KitItem.all
		@all_track_barcode=TrackBarcode.all
		@all_product_kind_category=ProductKindCategory.all
		@all_general_product=Product.last
		
	end

	
	 def destroy 
		@general_product = Product.find(params[:id])
		if@general_product.destroy!
			flash[:success] = "product Deleted"
			redirect_to products_list_products_path
			else
			flash[:error] = "product Not Deleted"
			redirect_to products_list_products_path
  	    end
 	 end


  def update
  	@general_product = Product.find(params[:id])
  	if @general_product.update_attributes(params_general_product)
  	    if @general_product.save
  	    	flash[:success] = "New product Update"
  			redirect_to product_path
  		else
  			puts "Error"
  			puts "=========>>>>   #{@general_product.errors.full_messages.to_sentence}"
  	 		flash[:error] = "New product Not created"
  			redirect_to edit_products_path
  	    end
  	end
  end

    def get_product_kind
  	  val = params[:value]
  	  if val.present?
  	  	@product_kind_category = ProductKindCategory.find_by_name(val)
  	  	if @product_kind_category.blank?
  	  		@product_kind_category = ProductKindCategory.create(:name=> val)
  	  	end
		  	@all_product_kind_category=ProductKindCategory.all
				render :json => {:current_kind_cat => @product_kind_category,:all_current_kind_cats => @all_product_kind_category}
  	     end		  
       end

	private
	def params_general_product
		params.require(:product).permit(:manufacturer,:name, :barcode, :rental_sale,:product_type_id,:product_status_id,:is_kit,:product_category_id,:kit_item_id,:track_barcode_id,:product_kind_category_id, product_pricing_attributes:[:cost, :price, :taxable, :vendor_id, :product_id, :id, :_destroy],product_images_attributes:[:image, :id, :product_id,:_destroy],product_descriptions_attributes:[:description, :id,:product_id, :destroy], inventory_attributes:[:barcode, :serial_no,:date, :purchase_cost, :depreciation_year, :approx_value, :year_placed_in_svc ,:id, :product_id, :destroy], product_sales_attributes:[:quantity_in_stock, :reorder_when_at_or_below,:reorder_qty, :id, :product_id,:_destroy], product_kit_items_attributes:[:kit_item_id,:quantity, :id, :product_id,:_destroy],product_track_codes_attributes:[:track_barcode_id, :id, :product_id,:_destroy],product_rental_attributes:[:day1, :day3, :day2, :weekly, :depreciation_year, :estimated_rental_days_per_year, :estimated_daily_cost, :id, :product_id, :_destroy, product_pricing_rents_attributes:[:name, :price, :product_rental_id, :id, :_destroy ]])
	end

	def shopify_product_auth
		shop_url = "https://bfb97c06efd23ddeed42a1c277126d4c:6683c3b241b05d5f473c0990e8c108fd@duallcamera.myshopify.com/admin"
		ShopifyAPI::Base.site = shop_url
	end
end