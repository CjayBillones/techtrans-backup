class CreateIpNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_needs do |t|
      t.text :title
      t.text :description
      t.text :features
      t.text :business_model
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ip_needs, [:user_id, :created_at]
  end
end
