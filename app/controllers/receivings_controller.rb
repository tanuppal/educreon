class ReceivingsController < ApplicationController
	

	def product_received
		@receiving = Receiving.new
		# @all_receiving = Receiving.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
		if params[:your_product_list].present?
			order_id = params[:your_product_list][:order_id]
			@order = Order.find_by_number(order_id)
		end
	end

	def receiving_list
		# @order_receive_list = Order.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
		@all_receiving = Receiving.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
	end

	def get_received_receipt
		@last_receive = Receiving.find(params[:id])
		@company_last = Company.last
		respond_to do |format|
		  format.html
		  format.pdf do
		    render pdf: "received_receipt", :page_size => 'A4'   # Excluding ".pdf" extension.
		  end
		end
	end

	def recent_inventory_list

	end

	def pos_bills_list
		
	end


	def barcode_search_receiving
		barcode = params[:barcode]
		if barcode.present?
			product = Product.find_by_barcode(barcode)
			order_s = OrderScheduling.where("product_id=? and status=?",product.id,true).order("rental_return ASC").limit(1)
			if order_s.present?
			order_scheduling = OrderScheduling.where("product_id=? and status=? and rental_return >=? and rental_return <= ?",product.id,true,order_s[0].rental_return ,order_s[0].rental_return).last
			else
				order_scheduling = ""
			end
			if order_scheduling.present?
				order = Order.includes(:customer).find(order_scheduling.order_id)
				product_image_url = product.product_images.last.image.url(:thumb)
				render :json => {:product => product, :product_image_url=> product_image_url, :order_scheduling=> order_scheduling, :order=> order, :customer_name=> order.customer.name, :status=> true}
			else
				render :json => {:message=> "This Product's Order Not Created!!!", :status=> false}
			end
		end
	end

	def create
		@receiving = Receiving.new(params_receiving)
		if @receiving.save
			flash[:success] = "Receiving Created"
			redirect_to product_received_receivings_path
		else
			puts "#{@receiving.errors.full_messages.to_sentence}"
			flash[:error] = "Receiving not Created!!"
			redirect_to product_received_receivings_path
		end
	end

	def edit
		@receiving = Receiving.find(params[:id])
	end

	def update
		@receiving = Receiving.find(params[:id])
		if @receiving.update_attributes(params_receiving)
			flash[:success] = "Receiving updated"
			redirect_to product_received_receivings_path
		else
			flash[:error] = "Somthing went wrong!!"
			render product_received_receivings_path
		end
	end

	def destroy 
		@receiving = Receiving.find(params[:id])
		if @receiving.destroy
			flash[:success] = "Receiving Deleted"
			redirect_to product_received_receivings_path
		else
			flash[:error] = "Receiving Not Deleted"
			redirect_to product_received_receivings_path
		end
	end

  private
	def params_receiving
		params.require(:receiving).permit(:received_date, receiving_products_attributes:[:product_id, :order_id, :receiving_id, :fine, :id, :_destroy])
	end

end
