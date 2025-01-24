class Order < ApplicationRecord
  belongs_to :order_type,required: false
  belongs_to :sales_person,required: false
  belongs_to :payment_term,required: false
  belongs_to :order_status,required: false
  belongs_to :customer,required: false

  after_create :create_new_bill
  after_create :sale_product_status
  before_create :random_case_number

  has_many :order_schedulings, :dependent => :destroy
  has_one :order_bill_to, :dependent => :destroy
  has_one :order_ship_to, :dependent => :destroy
  has_many :order_notes, :dependent => :destroy
  has_many :bills, :dependent => :destroy
  has_many :order_items, :dependent => :destroy
  has_one :order_payment, :dependent => :destroy
  has_many :receiving_products, :dependent => :destroy

 
  validates :customer_id, presence: true  
  validates :number, uniqueness: true
  validates :date, presence: true
  validates :payment_term_id, presence: true
  validates :order_status_id, presence: true  

  accepts_nested_attributes_for :order_schedulings, :allow_destroy => true, reject_if: proc { |attrr| attrr['product_id'].blank?}
  accepts_nested_attributes_for :order_bill_to, :allow_destroy => true
  accepts_nested_attributes_for :order_ship_to, :allow_destroy => true
  accepts_nested_attributes_for :order_notes, :allow_destroy => true
  accepts_nested_attributes_for :order_items, :allow_destroy => true
  accepts_nested_attributes_for :order_payment, :allow_destroy => true
  scope :all_order_count, -> {where( "id is NOT NULL")}
  
  def create_new_bill
    new_bill = Bill.new
    new_bill.order_id = self.id
    new_bill.date = Date.today
    new_bill.save
  end

  attr_accessor :bill_to_id
  attr_accessor :ship_to_id

  def random_case_number
    require 'securerandom'
    uniqu_number = p SecureRandom.random_number(100000000000)
    self.number = uniqu_number.to_i
  end

  def sale_product_status
    self.order_schedulings.each do |x|
      if x.product.product_type.name == "Sale"
        x.product.product_pricing.update_columns(:sale_status=> false)
      end
    end
  end
end
