class RemovePublishedAtFromAlbums < ActiveRecord::Migration
  def change
  	remove_column :albums, :published_at, :datetime
  end
end
