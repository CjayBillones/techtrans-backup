class AddDesignationToIndustries < ActiveRecord::Migration[5.0]
  def change
    add_column :industries, :designation, :string
  end
end
