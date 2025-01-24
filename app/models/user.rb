class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize do
    build_user_info if new_record? && user_info.blank?
  end
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :user_info, :dependent=> :destroy 
  # belongs_to :company, required: false 
  validates :email, presence: true
  validates_length_of :password, :minimum => 6, :maximum => 20, on: [:create, :change_password]
  validates_uniqueness_of :email, presence: true
  accepts_nested_attributes_for :user_info, :allow_destroy => true    
end
