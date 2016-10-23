class CreateAcademes < ActiveRecord::Migration[5.0]
  def change
    create_table :academes do |t|
      t.string :user_type
      t.string :id_number
      t.string :contact_number
      t.text   :address
      t.string :fb_url
      t.string :linkedin_url
      
      t.timestamps
    end
  end
end
