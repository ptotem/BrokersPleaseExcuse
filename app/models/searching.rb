class Searching < ActiveRecord::Base
  has_many :searching_bhk_configs, :dependent => :destroy
  has_many :searching_areas, :dependent => :destroy
  has_many :searching_facilities, :dependent => :destroy

  accepts_nested_attributes_for :searching_bhk_configs, :reject_if => lambda { |a| a[:bhk_config_id].blank? }
  accepts_nested_attributes_for :searching_areas, :reject_if => lambda { |a| a[:area_id].blank? }
  accepts_nested_attributes_for :searching_facilities, :reject_if => lambda { |a| a[:facility_id].blank? }

end
