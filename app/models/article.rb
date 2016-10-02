class Article < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  belongs_to :user

end