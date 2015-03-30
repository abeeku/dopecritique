class AddArtistMixToMusic < ActiveRecord::Migration
  def change
    add_reference :musics, :mixtape, index: true
    add_reference :musics, :album, index: true
  end
end
