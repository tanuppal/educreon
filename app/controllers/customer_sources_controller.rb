class CustomerSourcesController < ApplicationController
	  	before_action :set_customer_source, only: [:show, :edit, :update, :destroy]

		def create
		  @customer_source = CustomerSource.new(customer_source_params)
		  respond_to do |format|
		    if @customer_source.save
		      format.html { redirect_to new_customer_path, notice: 'customer source was successfully created.' }
		      format.js
		    else
		      format.html { render :new }
		      format.js
		    end
		  end
		end

		#get all customer terms
		def all_customer_source
			@all_customer_sources = CustomerSource.all
			render :json=> @all_customer_sources
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
		  def set_customer_source
		    @customer_source = CustomerSource.find(params[:id])
		  end

		  def customer_source_params
		    params.require(:customer_source).permit(:name)
		  end
end
