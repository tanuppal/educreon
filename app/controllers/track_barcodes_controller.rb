class TrackBarcodesController < ApplicationController
	before_action :set_track_barcode, only: [:show, :edit, :update, :destroy]

	def create
	  @track_barcode = TrackBarcode.new(track_barcode_params)
	  respond_to do |format|
	    if @track_barcode.save
	      format.html { redirect_to new_product_path, notice: 'Track Barcode was successfully created.' }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def all_track_barcode
		@all_track_barcodes = TrackBarcode.all
		render :json=> @all_track_barcodes
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
	  def set_track_barcode
	    @track_barcode = TrackBarcode.find(params[:id])
	  end

	  def track_barcode_params
	    params.require(:track_barcode).permit(:barcode,:serial_no,:date,:purchase_cost,:depreciation_year,:approx_value,:year_placed_in_svc)
	  end
end
