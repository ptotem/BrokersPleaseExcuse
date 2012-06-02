class BuildingQuality < ActiveRecord::Base
  belongs_to :building
  belongs_to :quality
  validates_uniqueness_of :building_id

end
