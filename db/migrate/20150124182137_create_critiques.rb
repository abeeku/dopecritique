class CreateCritiques < ActiveRecord::Migration
  def change
    create_table :critiques do |t|
      t.string :song
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :critiques, :user_id
  end
end
