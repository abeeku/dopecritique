class Music < ActiveRecord::Base
	belongs_to :artist
	has_many :critiques
	before_save :set_link

	acts_as_likeable

	def set_link
		video = VideoInfo.new(self.link)
		if video.available?
			self.video_img = video.thumbnail_medium
			self.duration =video.duration
		else
			self.image ="not available"
			self.duration = "not available"
		end
		
	end	
end
