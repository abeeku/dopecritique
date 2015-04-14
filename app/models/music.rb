class Music < ActiveRecord::Base
	belongs_to :artist
	has_many :critiques
	has_many :ratings
	belongs_to :album
	#belongs_to :mixtape
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

	def average_rating
		ratings.sum(:score)/ratings.size 
	end

	def get_rating
		Rating.where(music_id: self.id, user_id: current_user.id).first if Rating.where(music_id: self.id, user_id: current_user.id).first
		Rating.create(music_id: self.id, user_id: current_user.id, score: 0)
	end
	#def set_favorites
	#	favorites = likes.size
	#end
end
