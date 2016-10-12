class AddAttachmentDocumentToIpOffers < ActiveRecord::Migration
  def self.up
    change_table :ip_offers do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :ip_offers, :document
  end
end
