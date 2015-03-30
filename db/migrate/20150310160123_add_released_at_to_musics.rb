class AddReleasedAtToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :released_at, :datetime
  end
end
