class Poi < ActiveRecord::Base
  belongs_to :locality
  belongs_to :poi_type

  after_create :if_building

  def if_building
    if self.poi_type.name=="Building"
      if Building.find_by_name(self.name).blank?
        @building=Building.new
        @building.name=self.name
        @building.primary_locality_id=self.locality_id
        @building.latitude=self.latitude
        @building.longitude=self.longitude
        @building.qknote=self.note
        @building.save
      end
    end
  end

  def calc_distance(origin)
    radius = 6371
    lat1 = to_rad(origin[0])
    lat2 = to_rad(self.lat)
    lon1 = to_rad(origin[1])
    lon2 = to_rad(self.lng)
    dLat = lat2-lat1
    dLon = lon2-lon1

    a = Math::sin(dLat/2) * Math::sin(dLat/2) +
         Math::cos(lat1) * Math::cos(lat2) *
         Math::sin(dLon/2) * Math::sin(dLon/2);
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a));
    d = radius * c
  end

  def to_rad angle
    angle * Math::PI / 180
  end


end
