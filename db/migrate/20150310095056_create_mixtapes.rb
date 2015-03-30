class CreateMixtapes < ActiveRecord::Migration
  def change
    create_table :mixtapes do |t|
      t.string :name
      t.references :artist, index: true
      t.datetime :released_at

      t.timestamps
    end
  end
end
