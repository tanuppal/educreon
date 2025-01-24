class ProductTrackCode < ApplicationRecord
  belongs_to :track_barcode,required: false
  belongs_to :product,required: false
end
