class CreateIpOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_offers do |t|
      t.string  :title
      t.text    :subtitle
      t.text    :overview
      t.text    :key_features
      t.text    :applications
      t.text    :customer_edge
      t.text    :market_opportunity
      t.text    :inventors
      t.text    :patent_status
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ip_offers, [:user_id, :created_at]
  end
end
