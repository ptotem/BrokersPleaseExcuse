class BuildingFacility < ActiveRecord::Base
  belongs_to :building
  belongs_to :facility
end
