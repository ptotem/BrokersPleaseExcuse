class Locality < ActiveRecord::Base
  belongs_to :area
  belongs_to :quality
  has_many :locality_notes
  has_many :pois
  has_many :poi_types, :through => :pois
  has_many :building_localities
  has_many :buildings, :through => :building_localities
end
