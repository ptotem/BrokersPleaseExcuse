class Flat < ActiveRecord::Base
  belongs_to :flatype
  belongs_to :furnstat
  belongs_to :building
  belongs_to :bhk_config
  belongs_to :direction
  has_and_belongs_to_many :facilities
  has_and_belongs_to_many :facility_features
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
  has_many :interiors_qualities, :dependent => :destroy
  has_many :view_qualities, :dependent => :destroy
  has_many :parkings, :dependent => :destroy
  has_many :rental_terms, :dependent => :destroy
  has_many :showings, :dependent => :destroy

  accepts_nested_attributes_for :interiors_qualities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :view_qualities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :flat_notes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :expected_rents, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :available_froms, :reject_if => :any_blank, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :bhk_config_id

  before_create :create_flat_key

  def create_flat_key
    self.flat_key= self.building.name[0..2] + (Flat.all.empty? ? '10000' : "#{Flat.last.flat_key[-5,5].to_i+1}")
  end

end
