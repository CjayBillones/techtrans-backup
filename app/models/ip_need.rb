class IpNeed < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  belongs_to :user

  has_attached_file :photo, :styles => { :home_display => "200x106!"},
                    :url  => "/assets/ip-needs/:id/images/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/ip-needs/:id/images/:style/:basename.:extension"
  validates_attachment_size :photo, :less_than => 25.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  has_attached_file :document, 
                    :url  => "/assets/ip-needs/:id/documents/:basename.:extension",
                    :path => ":rails_root/public/assets/ip-needs/:id/documents/:basename.:extension"
  validates_attachment_size :document, :less_than => 50.megabytes
  validates_attachment_content_type :document, :content_type => ['application/pdf', 'application/msword',
                           'application/vnd.openxmlformats-officedocument.wordprocessingml.document']

  attr_reader :tag_tokens

  def tag_tokens=(ids)
    self.tags = ids
  end

end
