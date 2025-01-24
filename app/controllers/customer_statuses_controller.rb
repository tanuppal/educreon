class CustomerStatusesController < ApplicationController
	before_action :set_customer_status, only: [:show, :edit, :update, :destroy]

	def create
	  @customer_status = CustomerStatus.new(customer_status_params)
	  respond_to do |format|
	    if @customer_status.save
	      format.html { redirect_to new_customer_path, notice: 'customer status was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_customer_status
		@all_customer_statuses = CustomerStatus.all
		render :json=> @all_customer_statuses
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
	  def set_customer_status
	    @customer_status = CustomerStatus.find(params[:id])
	  end

	  def customer_status_params
	    params.require(:customer_status).permit(:status)
	  end
end
