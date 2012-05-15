class FacilityFeature < ActiveRecord::Base
  belongs_to :facility
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :flats
end
