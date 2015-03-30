class Mixtape < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :file
	  validates_attachment_content_type :file, :content_type => 
[ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ] 
 validates_attachment_size :file, :less_than => 101.megabytes 
	scope :coming_soon, -> {where("released_at >=",Date.today)}
end
