class Article < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  has_attached_file :banner_photo, :styles => { :home_display => "200x106!"},
                    :url  => "/assets/articles/:id/images/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/articles/:id/images/:style/:basename.:extension"
  validates_attachment_size :banner_photo, :less_than => 25.megabytes
  validates_attachment_content_type :banner_photo, content_type: /\Aimage/
  validates_attachment_file_name :banner_photo, matches: [/png\z/, /jpe?g\z/]

  belongs_to :user

end
