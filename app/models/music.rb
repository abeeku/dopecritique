class Music < ActiveRecord::Base
	belongs_to :artist
	has_many :critiques

	before_save :set_link#, :set_favorites
	acts_as_votable
	#acts_as_likeable
	
attr_accessor :favorites
	def self.highest_voted
    self.order("cached_votes_score DESC")
  end

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

	
	#def set_favorites
	#	favorites = likes.size
	#end
end
