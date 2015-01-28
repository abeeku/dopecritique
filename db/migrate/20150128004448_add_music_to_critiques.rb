class AddMusicToCritiques < ActiveRecord::Migration
  def change
    add_reference :critiques, :music, index: true
  end
end
