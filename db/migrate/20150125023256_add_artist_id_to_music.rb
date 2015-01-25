class AddArtistIdToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :artist_id, :integer
    add_index :musics, :artist_id
  end
end
