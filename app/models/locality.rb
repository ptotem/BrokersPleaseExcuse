class Locality < ActiveRecord::Base
  belongs_to :area
  belongs_to :quality
  has_many :locality_notes
  has_many :pois
  has_many :poi_types, :through => :pois
  has_many :building_localities
  has_many :buildings, :through => :building_localities
  has_many :primary_localities, :foreign_key => 'primary_locality_id', :class_name=>"locality"
end
