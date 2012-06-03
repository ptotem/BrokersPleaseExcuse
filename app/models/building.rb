class Building < ActiveRecord::Base

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
  has_many :services, :through => :building_services

  has_many :building_facilities, :dependent => :destroy
  has_many :facilities, :through => :building_facilities
  has_many :building_facility_features, :dependent => :destroy
  has_many :facility_features, :through => :building_facility_features


  accepts_nested_attributes_for :flats, :reject_if => proc { |attrs| reject = %w(name bhk_config_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :building_qualities, :reject_if => proc { |attrs| reject = %w(quality_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :approach_qualities, :reject_if => proc { |attrs| reject = %w(quality_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :moving_charges, :reject_if => :all_blank, :allow_destroy => true


  accepts_nested_attributes_for :building_notes, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :building_routes, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :building_services, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :building_localities, :reject_if => lambda { |a| a[:locality_id].blank? }, :allow_destroy => true

  accepts_nested_attributes_for :building_facilities, :reject_if => lambda { |a| a[:facility_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :building_facility_features, :reject_if => lambda { |a| a[:facility_feature_id].blank? }, :allow_destroy => true


  def main_locality
    primary_locality_id.blank? ? nil :Locality.find(self.primary_locality_id)
  end

  def full_name
    main_locality.nil? ? "#{self.name}" : "#{self.name}, #{self.main_locality.name}"
  end


end
