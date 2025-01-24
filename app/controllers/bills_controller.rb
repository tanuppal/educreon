class BillsController < ApplicationController
	def bills_list
		@company_last = Company.last
	  @all_general_bills = Bill.all.paginate(:page => params[:page], :per_page => 7).order("created_at DESC")
	end
	def get_vendors
		puts "------------>> #{params[:vendor_id]}"
		val = params[:vendor_id]
		@vendor_address = Vendor.find(params[:vendor_id])
	    vendor_location = @vendor_address.vendor_locations.last
	    vendor_contact_method = @vendor_address.vendor_contact_methods.last
	    country_name = Country.find(vendor_location.country_id)
	    state_name = State.find(vendor_location.state_id)
	    city_name = City.find(vendor_location.city_id)
		render json: {:address=> vendor_location, :vendor=> vendor_contact_method, :country_name=> country_name, :state_name=> state_name, :city_name=> city_name}
	end
	def new
		@bill_status = BillStatus.new
		@general_bill = Bill.new
	  	@all_general_vendor = Vendor.all
    	@all_vendor_term = VendorTerm.all
	  	@all_general_bill_status = BillStatus.all
	  	@all_vendor_country = Country.all
		@all_vendor_state = State.all
    	@all_vendor_city = City.all
	  	@all_general_bills = Bill.last
	  if params[:number].present?
        @last_bill_number = Bill.where(number: number).last
      end
  end

	def get_genarate_bill
		@last_bill = Bill.find(params[:id])
		@company_last = Company.last
		respond_to do |format|
		  format.html
		  format.pdf do
		    render pdf: "get_genarate_bill", :page_size => 'A4'   # Excluding ".pdf" extension.
		  end
		end
	end

  def create
		@general_bill = Bill.new(params_general_bill)
		if @general_bill.save
			flash[:success] = "New Bill Created"
			redirect_to bill_path
		else
		puts "#{@general_bill.errors.full_messages.to_sentence}"
			flash[:error] = "New Bill Not created"
			redirect_to new_bill_path
		end
	end

	def edit
		@general_bill = Bill.find(params[:id])
		@all_general_vendor = Vendor.all
        @all_vendor_term = VendorTerm.all
	    @all_general_bill_status = BillStatus.all
	    @all_vendor_country = Country.all
		@all_vendor_state = State.all
    	@all_vendor_city = City.all
    	@all_general_bills = Bill.last
	end

	def show
		@bill_status = BillStatus.new
        @general_bill = Bill.find(params[:id])
		@all_general_vendor = Vendor.all
        @all_vendor_term = VendorTerm.all
	    @all_general_bill_status = BillStatus.all
	    @all_vendor_country = Country.all
		@all_vendor_state = State.all
    	@all_vendor_city = City.all
    	@all_general_bills = Bill.last
	end

	def destroy
		@general_bill = Bill.find(params[:id])
		if @general_bill.destroy
			flash[:success] = "Bill deleted"
			redirect_to bills_list_bills_path
			else
			flash[:error]	= "Bill not deleted"
			redirect_to bills_list_bills_path
		end
	end

	def update
  	@general_bill = Bill.find(params[:id])
  	if @general_bill.update_attributes(params_general_bill)
  	    if @general_bill.save
  	    	flash[:success] = "New Bill Update"
  			redirect_to bills_list_bills_path
  		else
  			puts "Error"
  			puts "=========>>>>   #{@general_bill.errors.full_messages.to_sentence}"
  	 		flash[:error] = "New Bill Not updated"
  			redirect_to  edit_bill_path
  	    end
  	end
	end
	def params_general_bill
		params.require(:bill).permit(:number, :date, :eta, :vendor_id, :vendor_term_id, :bill_status_id,bill_notes_attributes:[:note, :bill_id,:id,:_destroy])
	end	
end
