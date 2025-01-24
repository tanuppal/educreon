class VendorTypesController < ApplicationController
	before_action :set_vendor_type, only: [:show, :edit, :update, :destroy]

	def create
	  @vendor_type = VendorType.new(vendor_type_params)
	  respond_to do |format|
	    if @vendor_type.save
	      format.html { redirect_to new_vendor_path, notice: 'vendor type was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_vendor_type
		@all_vendor_types = VendorType.all
		render :json=> @all_vendor_types
	end

	# def update
	#   respond_to do |format|
	#     if @vendor_type.update(vendor_type_params)
	#       format.html { redirect_to new_customer_path, notice: 'customer term was successfully updated.' }
	#       format.js
	#     else
	#       format.html { render :edit }
	#       format.js
	#     end
	#   end
	# end

	# def destroy
	#   @vendor_type.destroy
	#   respond_to do |format|
	#     format.html { redirect_to new_customer_path, notice: 'customer term was successfully destroyed.' }
	#     format.js
	#   end
	# end

	private
	  def set_vendor_type
	    @vendor_type = VendorType.find(params[:id])
	  end

	  def vendor_type_params
	    params.require(:vendor_type).permit(:name)
	  end
end


