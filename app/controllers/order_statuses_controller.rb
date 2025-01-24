class OrderStatusesController < ApplicationController
	before_action :set_order_status, only: [:show, :edit, :update, :destroy]

	def create
	  @order_status = OrderStatus.new(order_status_params)
	  respond_to do |format|
	    if @order_status.save
	      format.html { redirect_to new_order_path, notice: 'customer term was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def all_order_status
		@all_order_status = OrderStatus.all
		render :json=> @all_order_status
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
	  def set_order_status
	    @order_status = OrderStatus.find(params[:id])
	  end

	  def order_status_params
	    params.require(:order_status).permit(:status)
	  end
end
