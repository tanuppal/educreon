class OrdersController < ApplicationController
	before_action :shopify_order_auth, only: [:shopify_order_lists]

	def shopify_order_lists
		@order = ShopifyAPI::Order.find(:all)
	end


	def check_product_availability
		@all_product_kind_category =ProductKindCategory.all
	end

	def order_item_form
		
	end

	def orders
		@all_order_general=Order.all
		@all_order_scheduling=OrderScheduling.all
		@all_order_bill_to=OrderBillTo.all
		@all_order_ship_to=OrderShipTo.all
		@all_order_note=OrderNote.all
	end

	def get_customers
		puts "------------>> #{params[:customer_id]}"
		val = params[:customer_id]
		@customer_address = Customer.find(params[:customer_id])
		customer_location = @customer_address.customer_locations.last
		country_name = Country.find(customer_location.country_id)
		# state_name = State.find(customer_location.state_id)
		city_name = City.find(customer_location.city_id)
		render json: {:address=> customer_location, :country_name=> country_name, :city_name=> city_name}
	end

      
	def get_product_list
		val = params[:product_category_id]
		@product_category = ProductCategory.where(:id => params[:product_category_id]).last
		render json: @product_category.products
	end

  def new
		@general_order=Order.new
		@order_type = OrderType.new
		@sales_person = SalesPerson.new
		@payment_term = PaymentTerm.new
        @order_status = OrderStatus.new
        @order_payment_mode = OrderPaymentMode.new
		@all_order_type=OrderType.all
		@all_sales_person=SalesPerson.all
		@all_payment_term=PaymentTerm.all
		@all_order_status=OrderStatus.all
		@all_general_customer=Customer.where("active_status=?",true)
		@all_customer_location=CustomerLocation.all
		@country=Country.all
		@state=State.all
		@city=City.all
		@last_order=Order.last
		@all_general_product=Product.all
		@all_product_category=ProductCategory.all
		@all_product_kind_category =ProductKindCategory.all
		@all_order_payment_mode=OrderPaymentMode.all
	end

	def orders_list
		@all_order_general = Order.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
	    @new_order = Order.where("@all_order_general.created_at").count
	    @pending_order = OrderScheduling.where("status =?",true)
        #@renta_upcoming_order = OrderScheduling.where("")

	end

	def create
		@general_order = Order.new(params_general_order)
		if @general_order.save
			if params[:bill_to_id].present?
				@general_order.order_bill_to.update_columns(:customer_location_id=> params[:bill_to_id])
			end
			if params[:ship_to_id].present?
				@general_order.order_ship_to.update_columns(:customer_location_id=> params[:ship_to_id])
			end
			flash[:success] = "New Order Created"
			redirect_to new_order_path
		else
			puts "#{@general_order.errors.full_messages.to_sentence}"
			flash[:error] = "New Order Not created"
			redirect_to  orders_list_orders_path
		end
	end

	def edit
		@general_order=Order.find(params[:id])
		@all_order_type=OrderType.all
		@all_sales_person=SalesPerson.all
		@all_payment_term=PaymentTerm.all
		@all_order_status=OrderStatus.all
		@all_general_customer=Customer.all
		@all_customer_location=CustomerLocation.all
		@country=Country.all
		@state=State.all
		@city=City.all
	end
   
	def destroy 
  	@general_order = Order.find(params[:id])
  	if@general_order.destroy!
	  	flash[:success] = "order Deleted"
	  	redirect_to orders_list_orders_path
  	else
	  	flash[:error] = "order Not Deleted"
	  	redirect_to orders_list_orders_path
  	end
	 end

	def update
		@general_order = Order.find(params[:id])
		if @general_order.update_attributes(params_general_order)
			if @general_order.save
				flash[:success] = "New Order Update"
				redirect_to orders_list_orders_path
			else
				puts "Error"
				puts "=========>>>>   #{@general_order.errors.full_messages.to_sentence}"
				flash[:error] = "New Order Not created"
				redirect_to  edit_orders_path
			end
		end
	end

	def show
		@general_order = Order.find(params[:id])
		@all_order_type=OrderType.all
		@order_type = OrderType.new
		@sales_person = SalesPerson.new
		@payment_term = PaymentTerm.new
		@order_status = OrderStatus.new
		@all_sales_person=SalesPerson.all
		@all_payment_term=PaymentTerm.all
		@all_order_status=OrderStatus.all
		@all_general_customer=Customer.all
		@all_customer_location=CustomerLocation.all
		@country=Country.all
		@state=State.all
		@city=City.all
		# @last_order=Order.last
		# @all_general_product=Product.all
		@all_product_category=ProductCategory.all
	end

  #here we will get product wise description and image
  def get_description_image
		@product_description = Product.find(params[:product_id])
		product_location = @product_description.product_descriptions.last
		product_image = @product_description.product_images.last
		render json: {:description=> product_location, :image=> product_image}
	end

	def get_order_scheduling
		puts "------------>> #{params[:order_id]}"
		val = params[:order_id]
		@order_scheduling = Order.find(params[:order_id])
		order_rental = @order_scheduling.order_schedulings.last
		render json: {:order_rental=> order_rental}
	end

	def barcode_search
		barcode = params[:barcode]
		if barcode.present?
			product = Product.find_by_barcode(barcode)
			product_pricing = product.product_pricing.sale_status
			product_type = product.product_type.name
			product_image_url = product.product_images.last.image.url(:thumb)
			render :json => {:product => product, :product_image_url=> product_image_url, :product_type_name=> product_type, :sale_status=> product_pricing}
		end
		# render :json => {:message => "This Product is Not Returned Yet !!!", :product => product, :product_image_url=> product_image_url, :status=> false}
	end

	def rental_picup_date
		picup_date = params[:picup_date]
		product_id = params[:product_id]
		order_sed = OrderScheduling.where("product_id=? and status=? and rental_picup <= ? and rental_return >= ?",product_id,true,picup_date,picup_date)
		
		if order_sed.present?
			render :json => {:message => "This Product is Not Returned Yet !!!", :status=> false}
		else
			render :json => {:message => "This Product is Available !!!", :product_id=> product_id,  :status=> true}
		end
	end

  def product_kind_category
  	@product_kind_category = params[:product_kind_category_id]
  end

  def item_calenders
  	cat_id = params[:category_id]
  	product_kind_category = ProductKindCategory.find(cat_id)
  	products = product_kind_category.products.pluck(:id)
  	order_sched = OrderScheduling.where("product_id IN (?) and status=?",products,true)
	  events = []
	  order_sched.each do |rental|
	    aa_date = rental.rental_return
	    rental_return_date =  aa_date.to_date + 1.day
	    events << {:id=> rental.id, :title=> rental.product.name, :start=> rental.rental_picup.to_date, :end=> rental_return_date}
	   end
	   puts "===========>    #{events}"
	  render :json => events.to_json
  end

  private
	def params_general_order
		params.require(:order).permit(:order_type_id, :customer_id,:number,:sales_person_id,:date,:cust_po,:payment_term_id,:order_status_id,order_schedulings_attributes:[:rental_prep, :rental_picup, :rental_return, :order_id, :barcode, :product_id, :id, :_destroy], order_bill_to_attributes:[:customer_location_id, :country_id, :city_id,:order_id, :id, :_destroy], order_ship_to_attributes:[:customer_location_id, :country_id, :city_id,:order_id, :id, :_destroy] ,order_items_attributes:[:filter, :order_id, :product_category_id, :product_id, :product_kind_category_id, :id, :_destroy],order_notes_attributes:[:note, :order_id,:id,:_destroy], order_payment_attributes:[:payment_mode, :amount, :order_payment_mode_id, :order_id, :id,:_destroy, credit_card_detail_attributes:[:name, :card_number, :date, :card_cvc, :id, :_destroy]])
	end

#shopify Creadential
	def shopify_order_auth
		shop_url = "https://bfb97c06efd23ddeed42a1c277126d4c:6683c3b241b05d5f473c0990e8c108fd@duallcamera.myshopify.com/admin"
		ShopifyAPI::Base.site = shop_url
	end
end

