class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :road
      t.integer :pincode
      t.integer :primary_locality_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
