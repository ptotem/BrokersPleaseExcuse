class Searching < ActiveRecord::Base
  has_many :searching_bhk_configs, :dependent => :destroy
  has_many :searching_areas, :dependent => :destroy
  has_many :searching_facilities, :dependent => :destroy

  accepts_nested_attributes_for :searching_bhk_configs, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :searching_areas, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :searching_facilities, :reject_if => :all_blank, :allow_destroy => true

end
