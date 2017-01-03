class Academe < ApplicationRecord

  attr_accessor :terms, :terms_of_agreement

  has_one :user, :as => :accounts
  validates :user_type, presence: true
  validates :id_number, presence: true
  validates :terms, acceptance: true

end
