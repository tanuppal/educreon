class OrderTypesController < ApplicationController
	before_action :set_order_type, only: [:show, :edit, :update, :destroy]

	def create
	  @order_type = OrderType.new(order_type_params)
	  respond_to do |format|
	    if @order_type.save
	      format.html { redirect_to new_order_path, notice: 'customer term was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def all_order_type
		@all_order_type = OrderType.all
		render :json=> @all_order_type
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
	  def order_type
	    @order_type = OrderType.find(params[:id])
	  end

	  def order_type_params
	    params.require(:order_type).permit(:name)
	  end
end
