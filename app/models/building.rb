class Building < ActiveRecord::Base

  geocoded_by :full_address
  after_validation :geocode

  has_many :flats, :dependent => :destroy
  has_many :building_localities
  has_many :localities, :through => :building_localities
  belongs_to :primary_locality, :foreign_key => 'primary_locality_id', :class_name => "Locality"
  has_and_belongs_to_many :moving_requirements
  has_and_belongs_to_many :facilities
  has_and_belongs_to_many :facility_features
  has_and_belongs_to_many :restrictions
  has_many :approach_qualities, :dependent => :destroy
  has_many :building_qualities, :dependent => :destroy
  has_many :building_notes, :dependent => :destroy
  has_many :building_routes, :dependent => :destroy
  has_many :landmarks, :dependent => :destroy
  has_many :moving_charges, :dependent => :destroy
  has_many :building_services, :dependent => :destroy
  has_many :services, :through=> :building_services

  accepts_nested_attributes_for :flats, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :building_qualities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :approach_qualities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :moving_charges, :reject_if => :all_blank, :allow_destroy => true


  accepts_nested_attributes_for :building_notes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :building_routes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :building_services, :reject_if => :all_blank, :allow_destroy => true

  def full_address
    "#{self.name}, #{self.address}, #{self.road}, Mumbai, India"
  end

end
