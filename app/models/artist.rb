class Artist < ActiveRecord::Base
	has_many :musics
	#acts_as_likeable
	acts_as_votable

	def self.highest_voted
    self.order("cached_votes_score DESC")
  end
end
