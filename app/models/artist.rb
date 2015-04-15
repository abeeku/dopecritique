class Artist < ActiveRecord::Base
	has_many :musics
	has_many :taggings
	has_many :tags,through: :taggings
	has_many :ratings
	#acts_as_likeable
	acts_as_followable
	acts_as_votable
	acts_as_taggable 
	has_attached_file :avatar, :styles => { :medium => "400x400>",:thumb => "70x70#"}, :default_url=> "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def self.highest_voted
    self.order("cached_votes_score DESC")
  end

  def average_rating
  		if ratings.size >0
		ratings.sum(:score)/ratings.size 
	else
		0
	end
	end
end
