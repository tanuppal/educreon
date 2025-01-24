class ProductStatusesController < ApplicationController
	before_action :set_product_status, only: [:show, :edit, :update, :destroy]

	def create
	  @product_status = ProductStatus.new(product_status_params)
	  respond_to do |format|
	    if @product_status.save
	      format.html { redirect_to new_product_path, notice: 'product status was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_product_status
		@all_product_status = ProductStatus.all
		render :json=> @all_product_status
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
	  def set_product_status
	    @product_status = ProductStatus.find(params[:id])
	  end

	  def product_status_params
	    params.require(:product_status).permit(:status)
	  end



end
