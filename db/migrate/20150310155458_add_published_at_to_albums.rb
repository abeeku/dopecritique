class AddPublishedAtToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :published_at, :datetime
  end
end
