class CreateAcademes < ActiveRecord::Migration[5.0]
  def change
    create_table :academes do |t|
      t.string :academe_name
      t.string :unit
      t.string :department
      
      t.timestamps
    end
  end
end
