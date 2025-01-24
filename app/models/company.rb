class Company < ApplicationRecord
  belongs_to :country, required: false
  belongs_to :state, required: false
  belongs_to :city, required: false
  has_one :company_default, :dependent => :destroy
  has_many :company_rate_factors, :dependent => :destroy
  # has_many :users, :dependent => :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :pin_code, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  	has_attached_file :logo,
      :styles   => {
      :tiny       => "20x20",
      :thumb      => "200x200",
      :smalla     => "100x100",
      :smallb     => "150x150",
      :medium     => "240x340",
      :mediumb    => "430x375",
      :mediumc    => "360x375",
        :pslide     => "500x300",
      :large      => "1280x720"
  }

   validates_attachment :logo,
    #:presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  accepts_nested_attributes_for :company_rate_factors, :allow_destroy => true
  accepts_nested_attributes_for :company_default, :allow_destroy => true
  # accepts_nested_attributes_for :users, :allow_destroy => true
  
end
