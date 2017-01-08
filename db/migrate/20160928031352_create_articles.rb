class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string  :title
      t.text    :content
      t.text    :tags
      t.references :user, foreign_key: true
      t.integer :edited_by_id

      t.timestamps
    end
    add_index :articles, [:user_id, :created_at]
  end
end
