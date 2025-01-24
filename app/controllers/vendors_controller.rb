class VendorsController < ApplicationController
	def vendor_list
      @all_vendor_count=Vendor.count
	    @all_general_vendor = Vendor.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
		  @all_vendor_contact = VendorContactMethod.all
		  @all_vendor_Location = VendorLocation.all
	    @all_vendor_note = VendorNote.all
	    @all_vendor_document = VendorDocument.all
	    @all_vendor_person = VendorPerson.all
      @active_vendor= 0
      Vendor.all.each do |m|
      @active_vendor += VendorStatus.where("id=? and status= ?", m.vendor_status_id,"Active").count
    end
      @inactive_vendor= 0
      Vendor.all.each do |x|
      @inactive_vendor += VendorStatus.where("id=? and status= ?", x.vendor_status_id, "Inactive").count
    end
	end
	def new
    @general_vendor = Vendor.new
    @vendor_type = VendorType.new
    @vendor_term = VendorTerm.new
    @vendor_status = VendorStatus.new
    @city = City.new
		@all_vendor_type = VendorType.all
		@all_vendor_term = VendorTerm.all
		@all_vendor_status = VendorStatus.all
		@all_vendor_document_type = DocumentType.all
		@all_vendor_person = VendorPerson.all
		@all_vendor_country = Country.all
		# @all_vendor_state = State.limit 100
  #   @all_vendor_city = City.limit 100
		@all_vendor_people_contact = VendorPeopleContactMethod.all
		@all_vendor_Location = VendorLocation.all
		@all_general_vendor = Vendor.last
    @all_general_customer = Customer.last
    # for vendor_address
    @all_vendor_state = State.where("country_id=?",@general_vendor.vendor_locations.try(:country_id))
    @all_vendor_city = City.where("state_id=?",@all_vendor_state.try(:state_id))
  end

  def create
		@general_vendor = Vendor.new(params_general_vendor)
		if @general_vendor.save
			flash[:success] = "New Vendor Created"
			redirect_to vendor_list_vendors_path
		else
		puts "#{@general_vendor.errors.full_messages.to_sentence}"
			flash[:error] = "New Vendor Not created"
			redirect_to new_vendor_path
		end
	end

  def show
    @vendor_type = VendorType.new
    @vendor_term = VendorTerm.new
    @vendor_status = VendorStatus.new
    @general_vendor = Vendor.new
    @general_vendor = Vendor.find(params[:id])
    @all_vendor_type = VendorType.all
    @all_vendor_term = VendorTerm.all
    @all_vendor_status = VendorStatus.all
    @all_vendor_document_type = DocumentType.all
    @all_vendor_person = VendorPerson.all
    @all_vendor_people_contact = VendorPeopleContactMethod.all
    @all_vendor_Location = VendorLocation.all
    @all_general_vendor = Vendor.last
    @all_vendor_country = Country.all
    if @general_vendor.vendor_locations.last.try(:country_id).present?
      @all_vendor_state = State.where("country_id=?",@general_vendor.vendor_locations.last.country_id)
    else
      @all_vendor_state = State.last 200
    end 
    if @general_vendor.vendor_locations.last.try(:state_id).present?
      @all_vendor_city = City.where("state_id=?",@general_vendor.vendor_locations.last.state_id)
    else
      @all_vendor_city = City.last 200
    end
  end
  
  def edit
  		@general_vendor = Vendor.find(params[:id])
  		@all_vendor_type = VendorType.all
	    @all_vendor_term = VendorTerm.all
	    @all_vendor_status = VendorStatus.all
	    @all_vendor_document_type = DocumentType.all
	    @all_vendor_person = VendorPerson.all
	    @all_vendor_country = Country.all
	    @all_vendor_state = State.limit 100
	    @all_vendor_city = City.limit 100
      @all_vendor_people_contact = VendorPeopleContactMethod.all
		  @all_vendor_Location = VendorLocation.all
		  @all_general_vendor = Vendor.last
  end

  def destroy 
  	@general_vendor = Vendor.find(params[:id])
  	if @general_vendor.destroy
  	flash[:success] = "vendor Deleted"
  	redirect_to vendor_list_vendors_path
  	else
  	flash[:error] = "vendor Not Deleted"
  	redirect_to vendor_list_vendors_path
  	end
  end

  def update
  	@general_vendor = Vendor.find(params[:id])
  	if @general_vendor.update_attributes(params_general_vendor)
  	    if @general_vendor.save
  	    	flash[:success] = "New vendor Update"
  			redirect_to vendor_path
  		else
  			puts "Error"
  			puts "=========>>>>   #{@general_vendor.errors.full_messages.to_sentence}"
  	 		flash[:error] = "New vendor Not created"
  			redirect_to  edit_vendor_path
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
	def params_general_vendor
		params.require(:vendor).permit(:name, :vendor_type_id, :vendor_term_id, :url, :vendor_status_id, vendor_notes_attributes:[:note, :id, :_destroy], vendor_documents_attributes:[:title, :document_type_id, :document_file, :id, :_destroy, :created_at], vendor_locations_attributes:[:name, :address_1, :address_2, :country_id, :state_id, :city_id, :phone, :is_primary, :id, :_destroy, :zipcode], vendor_contact_methods_attributes:[:contact_method_type, :phone, :email, :is_primary, :id, :_destroy], vendor_persons_attributes:[:first_name, :last_name, :salutation, :title, :status, :department, :id, :_destroy, vendor_people_contact_methods_attributes:[:contact_method_type, :phone, :email, :is_primary, :id, :_destroy]])
	end	
end
