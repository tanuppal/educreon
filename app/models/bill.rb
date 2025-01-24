class Bill < ApplicationRecord
  belongs_to :vendor, required: false
  belongs_to :order, required: false
  belongs_to :bill_status, required: false
  before_create :set_bill_number
  # validates :number, presence: true
  validates :date, presence: true
  # validates :vendor_term_id, presence: true
  # validates :bill_status_id, presence: true
  
  has_many :bill_notes, :dependent => :destroy
  accepts_nested_attributes_for :bill_notes, :allow_destroy => true
  
  def set_bill_number
    last_bill_number = Bill.maximum(:number)
    self.number = last_bill_number.to_i + 1  	
  end
end
