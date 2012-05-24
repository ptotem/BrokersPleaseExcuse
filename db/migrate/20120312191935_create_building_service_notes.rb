class CreateBuildingServiceNotes < ActiveRecord::Migration
  def change
    create_table :building_service_notes do |t|
      t.integer :building_service_id
      t.text :name

      t.timestamps
    end
  end
end
