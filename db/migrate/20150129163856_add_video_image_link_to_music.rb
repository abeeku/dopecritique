class AddVideoImageLinkToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :video_img, :string
  end
end
