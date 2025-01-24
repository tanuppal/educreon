class CustomerLocation < ApplicationRecord
  belongs_to :country, required: false
  belongs_to :state, required: false
  belongs_to :city, required: false
  belongs_to :customer, required: false

  has_many :order_bill_tos, :dependent => :destroy
  has_many :order_ship_tos, :dependent => :destroy

  validates :name, presence: true
  # validates :attn, presence: true
  validates :phone, presence: true
  validates :country_id, presence: true
  validates :state_id, presence: true
  validates :city_id, presence: true
  validates :address_line_1, presence: true
  validates :zipcode, presence: true
  
  before_save :check_is_true
  def check_is_true
    if self.is_primary == true
      all_customer_locations = CustomerLocation.where("customer_id = ?",self.customer_id)
      all_customer_locations.update_all(:is_primary => false)
    end
  end   
end
