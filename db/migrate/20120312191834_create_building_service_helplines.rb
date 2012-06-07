class CreateBuildingServiceHelplines < ActiveRecord::Migration
  def change
    create_table :building_service_helplines do |t|
      t.integer :building_service_id
      t.string :name

      t.timestamps
    end
  end
end
