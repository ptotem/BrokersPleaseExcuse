class CreateBuildingServices < ActiveRecord::Migration
  def change
    create_table :building_services do |t|
      t.integer :building_id
      t.integer :service_id
      t.string :name

      t.timestamps
    end
  end
end
