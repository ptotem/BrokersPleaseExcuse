class Facility < ActiveRecord::Base
  has_many :facility_features, :dependent => :destroy
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :flats
end
