class BuildingQuality < ActiveRecord::Base
  belongs_to :building
  belongs_to :quality
end
