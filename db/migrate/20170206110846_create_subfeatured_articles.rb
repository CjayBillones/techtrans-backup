class CreateSubfeaturedArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :subfeatured_articles do |t|
      t.integer :ranking
      t.integer :article_id
    end
  end
end
