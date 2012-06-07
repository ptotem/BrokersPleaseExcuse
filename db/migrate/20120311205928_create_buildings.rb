class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :road
      t.integer :pincode
      t.integer :primary_locality_id
      t.integer :approach_quality_id
      t.integer :building_quality_id
      t.integer :moving_charge
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
