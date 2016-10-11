class AddAttachmentPhotoToIpNeeds < ActiveRecord::Migration
  def self.up
    change_table :ip_needs do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :ip_needs, :photo
  end
end
