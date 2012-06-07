class CreateBuildingFacilityFeatures < ActiveRecord::Migration
  def change
    create_table :building_facility_features do |t|
      t.integer :building_id
      t.integer :facility_feature_id

      t.timestamps
    end
  end
end
