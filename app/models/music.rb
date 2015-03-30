class Music < ActiveRecord::Base
	belongs_to :artist
	has_many :critiques
	belongs_to :album
	belongs_to :mixtape
	before_create :set_link#, :set_favorites
	validates_presence_of :link
	acts_as_votable
	#acts_as_likeable
scope :coming_soon, -> {where("released_at >=",Date.today)}

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
