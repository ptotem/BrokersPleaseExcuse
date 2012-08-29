class FacilityFeature < ActiveRecord::Base
  belongs_to :facility

  has_many :building_facility_features, :dependent => :destroy
  has_many :buildings, :through => :building_facility_features

  has_many :flat_facility_features, :dependent => :destroy
  has_many :flats, :through => :flat_facility_features

end

