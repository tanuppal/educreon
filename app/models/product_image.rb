class ProductImage < ApplicationRecord
  belongs_to :product,required: false


  has_attached_file :image,
    :styles   => {
    :tiny       => "20x20",
    :thumb      => "200x200",
    :smalla     => "100x100",
    :smallb     => "150x150",
    :medium     => "240x340",
    :mediumb    => "430x375",
    :pslide     => "500x300",
    :large      => "1280x720"
  }

   validates_attachment :image,
    #:presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
