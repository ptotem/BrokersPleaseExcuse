class CreateBuildingsFacilityFeaturesJoinTable < ActiveRecord::Migration
  def change
    create_table :buildings_facility_features, :id => false do |t|
      t.integer :building_id
      t.integer :facility_feature_id
    end
  end
end
