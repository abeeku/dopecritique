class Critique < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :user
	belongs_to :music
	#acts_as_likeable
	acts_as_votable

	def self.highest_voted
    self.order("cached_votes_score DESC")
  end
	validates_presence_of :music
end
