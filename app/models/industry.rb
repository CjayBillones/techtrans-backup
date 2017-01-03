class Industry < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_accessor :terms, :terms_of_agreement
  
  has_one :user, :as => :accounts, :dependent => :destroy

  validates :industry_name, presence: true
  validates :contact_email, presence: true, length: { maximum: 255 }, 
            format: { with: VALID_EMAIL_REGEX }
  validates :employee_count, numericality: { :greater_than_or_equal_to => 1}, allow_nil: false
  validates :terms, acceptance: true

end
