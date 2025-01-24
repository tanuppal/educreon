class KitItemsController < ApplicationController
	before_action :set_kit_item, only: [:show, :edit, :update, :destroy]

	def create
	  @kit_item = KitItem.new(kit_item_params)
	  respond_to do |format|
	    if @kit_item.save
	      format.html { redirect_to new_product_path, notice: 'Kit Item was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def all_kit_item
		
		@all_kit_item = KitItem.all
		render :json=> @all_kit_item
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
	  def set_kit_item
	    @kit_item = KitItem.find(params[:id])
	  end

	  def kit_item_params
	    params.require(:kit_item).permit(:name,:quantity)
	  end
end
