class Academe < ApplicationRecord

  has_one :user, :as => :accounts
  validates :user_type, presence: true
  validates :id_number, presence: true

end
