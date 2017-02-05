class AddAdminTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_type, :string
  end
end
