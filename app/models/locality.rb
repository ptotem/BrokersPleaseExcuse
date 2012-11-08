class Locality < ActiveRecord::Base
  belongs_to :area
  belongs_to :quality
  has_many :locality_notes,:dependent => :destroy
  has_many :pois,:dependent => :destroy
  has_many :poi_types, :through => :pois
  has_many :building_localities,:dependent => :destroy
  has_many :primary_localities,:dependent => :destroy
  has_many :buildings, :through => :primary_localities

end
