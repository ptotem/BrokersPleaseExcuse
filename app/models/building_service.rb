class BuildingService < ActiveRecord::Base
  belongs_to :building
  belongs_to :service
  has_many :building_service_helplines, :dependent => :destroy
  has_many :building_service_notes, :dependent => :destroy

  accepts_nested_attributes_for :building_service_helplines, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :building_service_notes, :reject_if => :all_blank, :allow_destroy => true


end
