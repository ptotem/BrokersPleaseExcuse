class FlatFacilityFeature < ActiveRecord::Base
  belongs_to :flat
  belongs_to :facility_feature
end
