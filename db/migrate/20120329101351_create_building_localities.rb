class CreateBuildingLocalities < ActiveRecord::Migration
  def change
    create_table :building_localities do |t|
      t.integer :building_id
      t.integer :locality_id
      t.boolean :primary

      t.timestamps
    end
  end
end
