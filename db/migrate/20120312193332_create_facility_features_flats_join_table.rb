class CreateFacilityFeaturesFlatsJoinTable < ActiveRecord::Migration
  def change
      create_table :facility_features_flats, :id => false do |t|
        t.integer :flat_id
        t.integer :facility_feature_id
      end
    end
end
