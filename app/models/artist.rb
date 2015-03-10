class Artist < ActiveRecord::Base
	has_many :musics
	#acts_as_likeable
	acts_as_votable
	has_attached_file :avatar, :styles => { :medium => "400x400>",:thumb => "70x70#"}, :default_url=> "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def self.highest_voted
    self.order("cached_votes_score DESC")
  end
end
