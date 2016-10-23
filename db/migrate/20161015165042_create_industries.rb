class CreateIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :industries do |t|
      t.string :industry_name
      t.string :country_code
      t.string :address
      t.string :contact_person
      t.string :contact_email   
      t.string :contact_number
      t.string :classification
      t.integer :employee_count, default: 1, null: false
      t.string :locations, array: true
      t.string :site_url
      t.string :fb_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
