class RentalSetting < ApplicationRecord
	has_attached_file :logo,
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

	validates_attachment :logo,
	#:presence => true,
	:size => { :in => 0..10.megabytes },
	:content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

	scope :rental_setting_id , -> (id){where( id: id)}
end
