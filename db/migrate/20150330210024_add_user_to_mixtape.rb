class AddUserToMixtape < ActiveRecord::Migration
  def change
    add_reference :mixtapes, :user, index: true
    remove_column :mixtapes, :artist_id
  end
end
