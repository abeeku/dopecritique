class AddLinkTypeToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :link_type, :string
  end
end
