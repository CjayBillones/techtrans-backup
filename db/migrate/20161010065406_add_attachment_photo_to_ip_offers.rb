class AddAttachmentPhotoToIpOffers < ActiveRecord::Migration
  def self.up
    change_table :ip_offers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :ip_offers, :photo
  end
end
