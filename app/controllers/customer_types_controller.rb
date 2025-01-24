class CustomerTypesController < ApplicationController
  	before_action :set_customer_type, only: [:show, :edit, :update, :destroy]

	def create
	  @customer_type = CustomerType.new(customer_type_params)
	  respond_to do |format|
	    if @customer_type.save
	      format.html { redirect_to new_customer_path, notice: 'customer type was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_customer_type
		@all_customer_types = CustomerType.all
		render :json=> @all_customer_types
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
	  def set_customer_type
	    @customer_type = CustomerType.find(params[:id])
	  end

	  def customer_type_params
	    params.require(:customer_type).permit(:name)
	  end	
end
