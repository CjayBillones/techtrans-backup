class AddAttachmentDocumentToIpNeeds < ActiveRecord::Migration
  def self.up
    change_table :ip_needs do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :ip_needs, :document
  end
end
