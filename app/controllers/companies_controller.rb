class CompaniesController < ApplicationController
	def company_list
		@all_general_company = Company.all.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
	  
	end
	def get_activity_types
  		puts "========================>>>>>>>>>>>>  #{params[:name]}"
		activity_type = ActivityType.new
		activity_type.name = params[:name]
		if activity_type.save
			flash[:success] = "New activity Type Created"
			redirect_to company_list_companies_path
		else
			flash[:error] = "New activity Type Not created"
			redirect_to  new_company_path
		end
  	end
	def new
		@activity_type = ActivityType.new
		@preference_company = Company.new
		@city=City.new
		@all_preference_country = Country.all
		# @all_preference_state = State.limit 100
		# @all_preference_city = City.limit 100
		# for customer_address
		@all_preference_state = State.where("country_id=?",@preference_company.try(:country_id))
		@all_preference_city = City.where("state_id=?",@all_preference_state.try(:state_id))
		@all_activity_type = ActivityType.all
		# @all_company_default = CompanyDefault.all
	    @all_customer_shipping = CustomerShipping.all
		@all_general_company = Company.last
		# @user =User.new
		if params[:password].blank?
		   params.delete(:password)
		end
	end

	def create
		@preference_company = Company.new(params_preference_company)
		puts "=============>#{@preference_company.errors.full_messages.to_sentence}"
		if @preference_company.save
			flash[:success] = "New Preference Created"
			redirect_to new_company_path
		else
		puts "#{@preference_company.errors.full_messages.to_sentence}"
			flash[:error] = "New Preference Not created"
			redirect_to new_company_path
		end
	end 
	def show
		@activity_type = ActivityType.new
		@preference_company = Company.find(params[:id])
		@all_activity_type = ActivityType.all
		@all_company_default = CompanyDefault.all
	    @all_customer_shipping = CustomerShipping.all
		@all_factors=CompanyRateFactor.all
		@all_general_company = Company.last
		@all_preference_country = Country.all
		# if @preference_company.try(:country_id).present?
      	# @all_preference_state = State.where("country_id=?", @preference_company.country_id)
	    # else
	    # @all_preference_state = State.all
	    # end 
	    # if @preference_company.try(:state_id).present?
	      # @all_preference_city = City.where("state_id=?",@preference_company.state_id)
	    # else
	      # @all_preference_city = City.all
	    # end	
	end
	def edit
  		@preference_company = Company.find(params[:id])
  		@all_preference_country = Country.all
		@all_preference_state = State.limit 100
		@all_preference_city = City.limit 100
		@all_activity_type = ActivityType.all
		 @all_company_default = CompanyDefault.all
	    @all_customer_shipping = CustomerShipping.all
		@all_factors=CompanyRateFactor.all
		@all_general_company = Company.last
  end
  def destroy 
  	@preference_company = Company.find(params[:id])
  	if @preference_company.destroy
  	flash[:success] = "company Deleted"
  	redirect_to company_list_companies_path
  	else
  	flash[:error] = "company Not Deleted"
  	redirect_to company_list_companies_path
  	end
  end
  	def update
	  	@preference_company = Company.find(params[:id])
	  	if @preference_company.update_attributes(params_preference_company)
	  	    if @preference_company.save
	  	    	flash[:success] = "New company Update"
	  			redirect_to company_path
	  		else
	  			puts "Error"
	  			puts "=========>>>>   #{@preference_company.errors.full_messages.to_sentence}"
	  	 		flash[:error] = "New company Not created"
	  			redirect_to  edit_company_path
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
    render json: state.cities.order("name ASC")
  end
  
  
	private
	def params_preference_company
		params.require(:company).permit(:name, :address, :country_id, :state_id, :city_id, :pin_code, :phone, :fax, :email, :url, :logo, company_rate_factors_attributes:[:label, :day, :factor, :id, :_destroy], company_default_attributes:[:activity_type_id, :sales_tax_rate, :customer_shipping_id, :shipping_charge, :id, :_destroy])
	end
end
