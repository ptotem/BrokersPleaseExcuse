class PoiType < ActiveRecord::Base
  has_many :pois
  has_many :localities, :through => :pois
end
