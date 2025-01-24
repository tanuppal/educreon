class VendorTermsController < ApplicationController
	before_action :set_vendor_term, only: [:show, :edit, :update, :destroy]

	def create
	  @vendor_term = VendorTerm.new(vendor_term_params)
	  respond_to do |format|
	    if @vendor_term.save
	      format.html { redirect_to new_vendor_path, notice: 'vendor term was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_vendor_term
		@all_vendor_terms = VendorTerm.all
		render :json=> @all_vendor_terms
	end

	# def update
	#   respond_to do |format|
	#     if @vendor_term.update(vendor_term_params)
	#       format.html { redirect_to new_customer_path, notice: 'customer term was successfully updated.' }
	#       format.js
	#     else
	#       format.html { render :edit }
	#       format.js
	#     end
	#   end
	# end

	# def destroy
	#   @vendor_term.destroy
	#   respond_to do |format|
	#     format.html { redirect_to new_customer_path, notice: 'customer term was successfully destroyed.' }
	#     format.js
	#   end
	# end

	private
	  def set_vendor_term
	    @vendor_term = VendorTerm.find(params[:id])
	  end

	  def vendor_term_params
	    params.require(:vendor_term).permit(:term)
	  end
end

