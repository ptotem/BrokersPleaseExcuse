class BuildingServiceHelpline < ActiveRecord::Base
 belongs_to :building_service
 validates_presence_of :name
end
