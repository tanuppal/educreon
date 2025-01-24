class DocumentType < ApplicationRecord
	has_many :customer_documents, :dependent => :destroy
	has_many :vendor_documents, :dependent => :destroy
end
