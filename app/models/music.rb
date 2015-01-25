class Music < ActiveRecord::Base
	belongs_to :artist
	has_many :critiques

	has_reputation :likes, source: :user,aggregated_by: :sum
end
