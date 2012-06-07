class CreateFlatFacilityFeatures < ActiveRecord::Migration
  def change
    create_table :flat_facility_features do |t|
      t.integer :flat_id
      t.integer :facility_feature_id

      t.timestamps
    end
  end
end
