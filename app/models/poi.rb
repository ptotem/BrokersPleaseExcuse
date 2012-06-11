class Poi < ActiveRecord::Base
  belongs_to :locality
  belongs_to :poi_type

  after_create :if_building

  def if_building
    if self.poi_type.name=="Building"
      unless Building.find_by_name(self.name).blank?
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

end
