class CreateBuildingFacilities < ActiveRecord::Migration
  def change
    create_table :building_facilities do |t|
      t.integer :building_id
      t.integer :facility_id

      t.timestamps
    end
  end
end
