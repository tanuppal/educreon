class BillStatusesController < ApplicationController
	before_action :set_bill_status, only: [:show, :edit, :update, :destroy]

	def create
	  @bill_status = BillStatus.new(bill_status_params)
	  respond_to do |format|
	    if @bill_status.save
	      format.html { redirect_to new_bill_path, notice: 'bill status was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all bill status
	def all_bill_status
		@all_bill_statuses = BillStatus.all
		render :json=> @all_bill_statuses
	end

	# def update
	#   respond_to do |format|
	#     if @bill_status.update(bill_status_params)
	#       format.html { redirect_to new_customer_path, notice: 'customer term was successfully updated.' }
	#       format.js
	#     else
	#       format.html { render :edit }
	#       format.js
	#     end
	#   end
	# end

	# def destroy
	#   @bill_status.destroy
	#   respond_to do |format|
	#     format.html { redirect_to new_customer_path, notice: 'customer term was successfully destroyed.' }
	#     format.js
	#   end
	# end

	private
	  def set_bill_status
	    @bill_status = BillStatus.find(params[:id])
	  end

	  def bill_status_params
	    params.require(:bill_status).permit(:name)
	  end
end

