class ProductKindCategory < ApplicationRecord
  has_many :products, :dependent => :destroy
end
