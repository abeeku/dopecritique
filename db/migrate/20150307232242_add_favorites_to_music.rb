class AddFavoritesToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :favorites, :integer
  end
end
