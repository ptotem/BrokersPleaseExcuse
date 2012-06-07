class BuildingFacilityFeature < ActiveRecord::Base
  belongs_to :building
  belongs_to :facility_feature
end
