class Flat < ActiveRecord::Base
  belongs_to :flatype
  belongs_to :furnstat
  belongs_to :building
  belongs_to :bhk_config
  belongs_to :direction

  has_many :flat_facilities, :dependent => :destroy
  has_many :facilities, :through => :flat_facilities
  has_many :flat_facility_features, :dependent => :destroy
  has_many :facility_features, :through => :flat_facility_features

  has_many :available_froms, :dependent => :destroy
  has_many :flat_notes, :dependent => :destroy
  has_many :balconies, :dependent => :destroy
  has_many :bathrooms, :dependent => :destroy
  has_many :brokerages, :dependent => :destroy
  has_many :deals, :dependent => :destroy
  has_many :expected_rents, :dependent => :destroy
  has_many :flat_ciphers, :dependent => :destroy
  has_many :flat_contacts, :dependent => :destroy
  has_many :contacts, :through => :flat_contacts
  has_many :flat_restrictions, :dependent => :destroy
  has_many :restrictions, :through => :flat_restrictions
  has_many :parkings, :dependent => :destroy
  has_many :rental_terms, :dependent => :destroy
  has_many :showings, :dependent => :destroy
  has_many :photos, :dependent => :destroy

  accepts_nested_attributes_for :flat_notes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :expected_rents, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :available_froms, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :flat_contacts, :reject_if => proc { |attrs| reject = %w(flat_id contact_id labelling_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :contacts, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :photos, :reject_if => proc { |attrs| reject = %w(image).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  accepts_nested_attributes_for :flat_facilities, :reject_if => lambda { |a| a[:facility_id].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :flat_facility_features, :reject_if => lambda { |a| a[:facility_feature_id].blank?}, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :bhk_config_id

  before_create :create_flat_key

  def create_flat_key
    self.flat_key= self.building.name[0..2] + (Flat.all.empty? ? 'BPE10000' : "#{Flat.last.flat_key[-5,5].to_i+1}")
  end

end
