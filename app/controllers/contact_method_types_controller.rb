class ContactMethodTypesController < ApplicationController
	before_action :set_customer_contact_method_type, only: [:show, :edit, :update, :destroy]

	def create
	  @customer_contact_method_type = ContactMethodType.new(customer_contact_method_type_params)
	  respond_to do |format|
	    if @customer_contact_method_type.save
	      format.html { redirect_to new_customer_path, notice: 'customer contact_method_type was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_customer_contact_method_type
		@all_customer_contact_method_types = ContactMethodType.all
		render :json=> @all_customer_contact_method_types
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
	  def set_customer_contact_method_type
	    @customer_contact_method_type = ContactMethodType.find(params[:id])
	  end

	  def customer_contact_method_type_params
	    params.require(:contact_method_type).permit(:name)
	  end
end
