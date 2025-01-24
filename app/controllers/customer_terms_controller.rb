class CustomerTermsController < ApplicationController
	before_action :set_customer_term, only: [:show, :edit, :update, :destroy]

	def create
	  @customer_term = CustomerTerm.new(customer_term_params)
	  respond_to do |format|
	    if @customer_term.save
	      format.html { redirect_to new_customer_path, notice: 'customer term was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_customer_term
		@all_customer_terms = CustomerTerm.all
		render :json=> @all_customer_terms
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
	  def set_customer_term
	    @customer_term = CustomerTerm.find(params[:id])
	  end

	  def customer_term_params
	    params.require(:customer_term).permit(:name)
	  end
end
