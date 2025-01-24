class ProductKitItem < ApplicationRecord
  belongs_to :product,required: false
  belongs_to :kit_item,required: false
  # after_create :update_item_quantity

  # def update_item_quantity
  # 	all_kit = self.product.product_kit_items
  # 	 all_kit.each do |x|
  # 		kit_item = KitItem.find(x.kit_item_id)
  # 		kit_item.update_columns(:available_quantity => (kit_item.available_quantity - x.quantity))
  #  end
  # end
end
