class ProductTypesController < ApplicationController
	before_action :set_product_type, only: [:show, :edit, :update, :destroy]

	def create
	  @product_type = ProductType.new(product_type_params)
	  respond_to do |format|
	    if @product_type.save
	      format.html { redirect_to new_product_path, notice: 'product type was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_product_type
		@all_product_type = ProductType.all
		render :json=> @all_product_type
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
	  def set_product_type
	    @product_type = ProductType.find(params[:id])
	  end

	  def product_type_params
	    params.require(:product_type).permit(:name)
	  end
end

