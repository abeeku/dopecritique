class AddDurationToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :duration, :string
  end
end
