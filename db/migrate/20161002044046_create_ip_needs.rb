class CreateIpNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_needs do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ip_needs, [:user_id, :created_at]
  end
end
