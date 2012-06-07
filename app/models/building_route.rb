class BuildingRoute < ActiveRecord::Base
  belongs_to :building
  validates_uniqueness_of :name

end
