class Industry < ApplicationRecord

  has_one :user, :as => :accounts

end
