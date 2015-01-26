class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.name :string
      t.text :bio

      t.timestamps
    end
  end
end
