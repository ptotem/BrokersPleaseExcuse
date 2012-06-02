class BuildingNote < ActiveRecord::Base
  belongs_to :building
  validates_uniqueness_of :name

end
