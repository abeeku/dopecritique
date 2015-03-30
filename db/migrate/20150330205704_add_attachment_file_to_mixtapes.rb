class AddAttachmentFileToMixtapes < ActiveRecord::Migration
  def self.up
    change_table :mixtapes do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :mixtapes, :file
  end
end
