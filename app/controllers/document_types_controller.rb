class DocumentTypesController < ApplicationController
	before_action :set_customer_document_type, only: [:show, :edit, :update, :destroy]

	def create
	  @customer_document_type = DocumentType.new(customer_document_type_params)
	  respond_to do |format|
	    if @customer_document_type.save
	      format.html { redirect_to new_customer_path, notice: 'customer document_type was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all customer terms
	def all_customer_document_type
		@all_customer_document_types = DocumentType.all
		render :json=> @all_customer_document_types
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
	  def set_customer_document_type
	    @customer_document_type = DocumentType.find(params[:id])
	  end

	  def customer_document_type_params
	    params.require(:document_type).permit(:name)
	  end
end
