class Critique < ActiveRecord::Base
	belongs_to :user
	belongs_to :music
	acts_as_likeable
	validates_presence_of :music
end
