class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :username
      t.string    :email
      t.string    :password_digest
      t.string    :remember_digest
      t.string    :activation_digest
      t.boolean   :activated, default: false
      t.datetime  :activated_at
      t.string    :reset_digest
      t.datetime  :reset_sent_at
      t.boolean   :admin, default: false
      t.string   :approval_status, default: 'pending'
      t.references :accounts, polymorphic: true, index: true
      t.timestamps
    end
    add_index :users, [:username, :email], unique: true
  end
end
