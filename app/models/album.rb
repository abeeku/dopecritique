class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :musics

  # add scope or method coming soon that finds albums where release date is infront of regualr date
  scope :coming_soon, -> {where("released_at >=",Date.today)}
end
