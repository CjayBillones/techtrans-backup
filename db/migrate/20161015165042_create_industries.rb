class CreateIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :industries do |t|
      t.string :name
      t.string :email     
      t.string :contact_number
      
      t.timestamps
    end
  end
end
