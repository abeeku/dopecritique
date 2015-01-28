class Artist < ActiveRecord::Base
	has_many :musics
	acts_as_likeable
end
