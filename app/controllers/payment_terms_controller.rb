class PaymentTermsController < ApplicationController
	before_action :set_payment_term, only: [:show, :edit, :update, :destroy]

	def create
	  @payment_term = PaymentTerm.new(payment_term_params)
	  respond_to do |format|
	    if @payment_term.save
	      format.html { redirect_to new_order_path, notice: 'payment term was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def all_payment_term
		@all_payment_term = PaymentTerm.all
		render :json=> @all_payment_term
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
	  def set_payment_term
	    @payment_term = PaymentTerm.find(params[:id])
	  end

	  def payment_term_params
	    params.require(:payment_term).permit(:name)
	  end
end
