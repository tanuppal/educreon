class DashboardsController < ApplicationController
	def dashboard
		@total_customer = Customer.all_customer_count
		@total_vendor = Vendor.all_vendor_count
		@total_order = Order.all_order_count
		@total_product = Product.all_product_count

		#piechart method 
		@customer = Customer.all.count
		@product = Product.all.count
		@active = Customer.where("status=?","Active").count
		@inactive = Customer.where("status=?","Inactive").count
		#@product_enable = ProductStatus.where("id = ? and status =?",@product.product_status_id,"enable")
		@enable = 0
		Product.all.each do |s|
			@enable += ProductStatus.where("id=? AND status=?",s.product_status_id,"enable").count
		end
		@disable = 0
		Product.all.each do |t|
			@disable += ProductStatus.where("id=? AND status=?",t.product_status_id,"disable").count
		end
		@outside_product = OrderScheduling.where("status=?",true).count
		@inside_product =  OrderScheduling.where("status=?",false).count
	end
end
