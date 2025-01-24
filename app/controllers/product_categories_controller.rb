class ProductCategoriesController < ApplicationController
		before_action :set_product_category, only: [:show, :edit, :update, :destroy]

		def create
		  @product_category = ProductCategory.new(product_category_params)
		  respond_to do |format|
		    if @product_category.save
		      format.html { redirect_to new_product_path, notice: 'product category was successfully created.' }
		      format.js
		    else
		      format.html { render :new }
		      format.js
		    end
		  end
		end

		#get all customer terms
		def all_product_category
			@all_product_category = ProductCategory.all
			render :json=> @all_product_category
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
		  def set_product_category
		    @product_category = ProductCategory.find(params[:id])
		  end

		  def product_category_params
		    params.require(:product_category).permit(:category)
		  end
	


end
