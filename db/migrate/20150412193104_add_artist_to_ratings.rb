class AddArtistToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :artist, index: true
  end
end
