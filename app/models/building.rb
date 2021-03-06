class Building < ActiveRecord::Base
  geocoded_by :landmark   # can also be an IP address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  has_many :flats, :dependent => :destroy
  has_many :building_localities
  has_many :localities, :through => :building_localities
  has_one :primary_locality
  has_and_belongs_to_many :moving_requirements
  has_and_belongs_to_many :restrictions
  has_many :building_notes, :dependent => :destroy
  has_many :building_routes, :dependent => :destroy
  has_many :building_services, :dependent => :destroy
  has_many :services, :through => :building_services

  has_many :building_facilities, :dependent => :destroy
  has_many :facilities, :through => :building_facilities
  has_many :building_facility_features, :dependent => :destroy
  has_many :facility_features, :through => :building_facility_features

  accepts_nested_attributes_for :flats, :reject_if => proc { |attrs| reject = %w(name bhk_config_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :building_notes, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :building_routes, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :building_services, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :building_localities, :reject_if => lambda { |a| a[:locality_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :primary_locality, :reject_if => lambda { |a| a[:locality_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :building_facilities, :reject_if => lambda { |a| a[:facility_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :building_facility_features, :reject_if => lambda { |a| a[:facility_feature_id].blank? }, :allow_destroy => true

  has_attached_file :avatar,
                    :styles => {
                        :original => {
                            :geometry => "640x600<",
                            #:watermark_path => "#{Rails.root}/app/assets/images/watermark.jpg",
                            :position => "Center"
                        },
                        :lightbox => {
                            :geometry => "640x600>"
                        },
                        :thumbnail => {
                            :geometry => "300x300!"
                        }
                    }

  after_save :make_poi

  def main_locality
    primary_locality_id.blank? ? nil :Locality.find(self.primary_locality_id)
  end

  def full_name
    main_locality.nil? ? "#{self.name}" : "#{self.name}, #{self.main_locality.name}"
  end

  def make_poi
    unless (self.latitude.blank? or self.longitude.blank?)
      if Poi.find_by_name(self.name).blank?
        @poi=Poi.new
        @poi.name=self.name
        @poi.locality_id=self.primary_locality_id
        @poi.poi_type_id=PoiType.find_by_name("Building").id
        @poi.note=self.qknote
        @poi.latitude=self.latitude
        @poi.longitude=self.longitude
        @poi.save
      end
    end
  end

  before_save :insert_qualities
  before_create :insert_qualities

  def insert_qualities
    if self.approach_quality_id.blank?
      self.approach_quality_id=2

    end
    if self.building_quality_id.blank?
      self.building_quality_id=2

    end

  end

end
