class Rating < ActiveRecord::Base
  belongs_to :mixtape
  belongs_to :music
  belongs_to :artist
  belongs_to :user
end
