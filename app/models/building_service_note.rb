class BuildingServiceNote < ActiveRecord::Base
  belongs_to :building_service
  validates_presence_of :name
end
