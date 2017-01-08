class AddAttachmentBannerPhotoToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :banner_photo
    end
  end

  def self.down
    remove_attachment :articles, :banner_photo
  end
end
