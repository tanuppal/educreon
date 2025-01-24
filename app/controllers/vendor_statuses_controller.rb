class VendorStatusesController < ApplicationController
	before_action :set_vendor_status, only: [:show, :edit, :update, :destroy]

	def create
	  @vendor_status = VendorStatus.new(vendor_status_params)
	  respond_to do |format|
	    if @vendor_status.save
	      format.html { redirect_to new_vendor_path, notice: 'vendor status was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_vendor_status
		@all_vendor_statuses = VendorStatus.all
		render :json=> @all_vendor_statuses
	end

	# def update
	#   respond_to do |format|
	#     if @vendor_status.update(vendor_status_params)
	#       format.html { redirect_to new_customer_path, notice: 'customer term was successfully updated.' }
	#       format.js
	#     else
	#       format.html { render :edit }
	#       format.js
	#     end
	#   end
	# end

	# def destroy
	#   @vendor_status.destroy
	#   respond_to do |format|
	#     format.html { redirect_to new_customer_path, notice: 'customer term was successfully destroyed.' }
	#     format.js
	#   end
	# end

	private
	  def set_vendor_status
	    @vendor_status = VendorStatus.find(params[:id])
	  end

	  def vendor_status_params
	    params.require(:vendor_status).permit(:status)
	  end
end

