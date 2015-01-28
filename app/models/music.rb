class Music < ActiveRecord::Base
	belongs_to :artist
	has_many :critiques

	acts_as_likeable
end
