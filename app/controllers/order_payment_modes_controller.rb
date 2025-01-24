class OrderPaymentModesController < ApplicationController
before_action :set_order_payment_mode, only: [:show, :edit, :update, :destroy]

	def create
	  @order_payment_mode = OrderPaymentMode.new(order_payment_mode_params)
	  respond_to do |format|
	    if @order_payment_mode.save
	      format.html { redirect_to new_order_path }
	      format.js
	    else
	      format.html { render :new }
	      format.js
	    end
	  end
	end

	#get all order terms
	def get_order_payment_mode
		@all_order_payment_mode = OrderPaymentMode.all
		render :json=> @all_order_payment_mode
	end

	private
	  def set_order_payment_mode
	    @order_payment_mode = OrderPaymentMode.find(params[:id])
	  end

	  def order_payment_mode_params
	    params.require(:order_payment_mode).permit(:name)
	  end
end
