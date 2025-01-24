class ReceivingProduct < ApplicationRecord
  belongs_to :product,required: false
  belongs_to :receiving,required: false
  belongs_to :order,required: false

  after_create :order_status_change


  def order_status_change
  	order_scheduling = OrderScheduling.where("product_id=? and status=? and order_id=?",self.product_id,true,self.order_id).last
  	order_scheduling.update_columns(:status=> false)
  end
end
