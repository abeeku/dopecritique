class Mixtape < ActiveRecord::Base
	belongs_to :user
	has_many :ratings
	has_attached_file :file
	  validates_attachment_content_type :file, :content_type => 
  [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

 validates_attachment_size :file, :less_than => 101.megabytes 
	scope :coming_soon, -> {where("released_at >=",Date.today)}

	def average_rating
		ratings.sum(:score)/ratings.size 
	end
end
