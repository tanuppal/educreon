class CustomersController < ApplicationController
	    
	def customers_list
    @all_general_customer = Customer.where("active_status=?",true).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    @all_customer_method = CustomerContactMethod.all
    @all_customer_Location = CustomerLocation.all
    @all_customer_people = PeopleContact.all
    @all_customer_insurance = CustomerInsurance.all
    @all_customer_note = CustomerRelatedNote.all
    @all_customer_document = CustomerDocument.all
    @customer_yearly = Customer.where("YEAR(created_at)").count
    @customer_monthly = Customer.where("MONTH(created_at)").count
	end

	def delete_customer
		val = params[:id]
		customer = Customer.find(val)
		customer.update_columns(:active_status=> false)
		redirect_to customers_list_customers_path
	end

	def get_customer_addrs
		if params[:customer_id].present?
			@customer = Customer.find(params[:customer_id])
		end
	end

	def get_customer_new_addrs
		if params[:customer_id].present?
			@new_address_bill_customer = Customer.find(params[:customer_id])
			@country = Country.all
			if @new_address_bill_customer.try(:country_id).present?
			  @state = State.where("country_id=?",@new_address_bill_customer.country_id)
			else
			  @state = State.last 100
			end

			if @new_address_bill_customer.try(:state_id).present?
			  @city = City.where("state_id=?",@new_address_bill_customer.state_id)
			else
			  @city = City.last 200
			end
		end
	end

	def get_customer_ships
		if params[:customer_id].present?
			@ship_customer = Customer.find(params[:customer_id])
		end
	end

	def get_customer_new_ships
		if params[:customer_id].present?
			@new_address_ship_customer = Customer.find(params[:customer_id])
			@country = Country.all
			if @new_address_ship_customer.try(:country_id).present?
			  @state = State.where("country_id=?",@new_address_ship_customer.country_id)
			else
			  @state = State.last 100
			end

			if @new_address_ship_customer.try(:state_id).present?
			  @city = City.where("state_id=?",@new_address_ship_customer.state_id)
			else
			  @city = City.last 200
			end
		end
	end
	
	def new
		@customer_document_type = DocumentType.new
		@customer_contact_method_type = ContactMethodType.new
		@customer_status = CustomerStatus.new
		@customer_shipping = CustomerShipping.new
		@customer_source = CustomerSource.new
		@customer_term = CustomerTerm.new
		@general_customer = Customer.new
		@customer_type = CustomerType.new
		@city = City.new
		@all_customer_type = CustomerType.all
		@all_customer_term = CustomerTerm.all
    @all_customer_source = CustomerSource.all
    @all_customer_shipping = CustomerShipping.all
    @all_customer_status = CustomerStatus.all
    @all_customer_method_type = ContactMethodType.all
    @all_customer_country = Country.all
    @all_customer_document_type = DocumentType.all
		@all_general_customer = Customer.last
		# for customer_address
		@all_customer_state = State.where("country_id=?",@general_customer.customer_locations.try(:country_id))
		@all_customer_city = City.where("state_id=?",@all_customer_state.try(:state_id))
		# for customer_insurances
		@all_customer_state1 = State.where("country_id=?",@general_customer.customer_insurances.try(:country_id))
		@all_customer_city1 = City.where("state_id=?",@all_customer_state1.try(:state_id))
  end
  	
	def create
		@general_customer = Customer.new(params_general_customer)
    if @general_customer.save
	    	flash[:success] = "New Customer Created"
			redirect_to customers_list_customers_path
		else
			puts "#{@general_customer.errors.full_messages.to_sentence}"
	 		flash[:error] = "New Customer Not created"
			redirect_to  customers_list_customers_path
    end
	end

	def show
		@customer_document_type = DocumentType.new
		@customer_contact_method_type = ContactMethodType.new
		@customer_status = CustomerStatus.new
		@customer_shipping = CustomerShipping.new
		@customer_source = CustomerSource.new
		@customer_term = CustomerTerm.new
		@general_customer = Customer.new
		@customer_type = CustomerType.new
		@general_customer = Customer.find(params[:id])
		@all_customer_type = CustomerType.all
		@all_customer_term = CustomerTerm.all
		@all_customer_source = CustomerSource.all
		@all_customer_shipping = CustomerShipping.all
		@all_customer_status = CustomerStatus.all
		@all_customer_method_type = ContactMethodType.all
		@all_customer_document_type = DocumentType.all
		@country = Country.all
		@all_customer_state = State.all
	end

	def destroy 
		@general_customer = Customer.find(params[:id])
		if @general_customer.destroy
		flash[:success] = "Customer Deleted"
		redirect_to customers_list_customers_path
		else
		flash[:error] = "Customer Not Deleted"
		redirect_to customers_list_customers_path
		end
	end

	def update
		@general_customer = Customer.find(params[:id])
		respond_to do |format|
		  if @general_customer.update_attributes(params_general_customer)
		    format.html { redirect_to customer_path, success: 'New Customer Update' }
		    format.js
		    flash[:success] = "Customer Updated"
		  else
		  	puts "#{@general_customer.errors.full_messages.to_sentence}"
		    format.html { redirect_to customers_list_customers_path, error: "New Customer Not created" }
		    format.js
		    flash[:error] = "Customer not Updated"
		  end
		end
	end

  #getting all state of a country
  def get_state
		val = params[:country_id]
		country = Country.find(val)
		render json: country.states.order("name ASC")
  end
  #getting all cities of a state
  def get_city
    val = params[:state_id]
    state = State.find(val)
    puts "-------------------"
    render json: state.cities.order("name ASC")
  end
  
   private
	def params_general_customer
		params.require(:customer).permit(:name, :customer_type_id, :customer_term_id, :url, :customer_source_id, :customer_shipping_id, :customer_status_id,:status,customer_contact_methods_attributes:[:contact_method_type_id, :phone, :email, :is_primary, :id, :_destroy],customer_locations_attributes:[:name, :attn, :address_line_1, :address_line_2, :country_id, :state_id, :city_id, :phone, :landmark, :zipcode, :is_primary, :id, :_destroy],people_contacts_attributes:[:first_name, :last_name, :salutation, :title, :status, :department, :id, :_destroy,people_contact_methods_attributes:[:contact_method_type_id, :phone, :email, :is_primary, :_destroy, :id]], customer_insurances_attributes:[:provider, :coverage, :expired_by, :address, :country_id, :state_id, :city_id, :zipcode, :telephone, :fax, :email, :insured, :id, :_destroy], customer_related_notes_attributes:[:note, :id, :_destroy],customer_documents_attributes:[:title, :document_type_id, :document, :customer_id, :id, :_destroy, :created_at])
	end	
end
