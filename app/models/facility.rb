class Facility < ActiveRecord::Base
  has_many :facility_features, :dependent => :destroy

  has_many :building_facilities, :dependent => :destroy
  has_many :buildings, :through => :building_facilities

  has_many :flat_facilities, :dependent => :destroy
  has_many :flats, :through => :flat_facilities

end
