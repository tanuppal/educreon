class ProductType < ApplicationRecord
	has_one :product, :dependent => :destroy
end
