class RemoveSongFromCritiques < ActiveRecord::Migration
  def change
    remove_column :critiques, :song, :string
  end
end
