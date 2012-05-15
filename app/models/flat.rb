class Flat < ActiveRecord::Base
  belongs_to :flatype
  belongs_to :furnstat
  belongs_to :building
  belongs_to :bhk_config
  belongs_to :direction
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :task_actions
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
  has_many :tasks, :through=> :showings

  accepts_nested_attributes_for :interiors_qualities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :view_qualities, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :flat_notes, :reject_if => :all_blank, :allow_destroy => true

end
