class SalesPeopleController < ApplicationController
	before_action :set_sales_person, only: [:show, :edit, :update, :destroy]

	def create
	  @sales_person = SalesPerson.new(sales_person_params)
	  respond_to do |format|
	    if @sales_person.save
	      format.html { redirect_to new_order_path, notice: 'customer term was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def all_sales_person
		@all_sales_person = SalesPerson.all
		render :json=> @all_sales_person
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
	  def set_sales_person
	    @sales_person = SalesPerson.find(params[:id])
	  end

	  def sales_person_params
	    params.require(:sales_person).permit(:name)
	  end
end
