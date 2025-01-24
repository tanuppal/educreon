class CustomerShippingsController < ApplicationController
	before_action :set_customer_shipping, only: [:show, :edit, :update, :destroy]

	def create
	  @customer_shipping = CustomerShipping.new(customer_shipping_params)
	  respond_to do |format|
	    if @customer_shipping.save
	      format.html { redirect_to new_customer_path, notice: 'customer shipping was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_customer_shipping
		@all_customer_shippings = CustomerShipping.all
		render :json=> @all_customer_shippings
	end

	# def update
	#   respond_to do |format|
	#     if @customer_term.update(customer_term_params)
	#       format.html { redirect_to new_customer_path, notice: 'customer term was successfully updated.' }
	#       format.js
	#     else
	#       format.html { render :edit }
	#       format.js
	#     end
	#   end
	# end

	# def destroy
	#   @customer_term.destroy
	#   respond_to do |format|
	#     format.html { redirect_to new_customer_path, notice: 'customer term was successfully destroyed.' }
	#     format.js
	#   end
	# end

	private
	  def set_customer_shipping
	    @customer_shipping = CustomerShipping.find(params[:id])
	  end

	  def customer_shipping_params
	    params.require(:customer_shipping).permit(:name)
	  end
end
