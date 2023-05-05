class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      
      t.string :building_address
      t.string :building_contact_name
      t.string :building_contact_email
      t.string :square_footage
      t.string :image_url

      t.timestamps
    end
  end
end
