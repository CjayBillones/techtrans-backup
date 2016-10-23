class Academe < ApplicationRecord

  has_one :user, :as => :accounts

end
