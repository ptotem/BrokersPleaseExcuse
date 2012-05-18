class Interaction < ActiveRecord::Base
  has_many :taskings,:dependent => :destroy
  accepts_nested_attributes_for :taskings, :reject_if => proc { |a| a['due_date'].blank? }

  has_many :interaction_contacts,:dependent => :destroy
  has_many :contacts,:through => :interaction_contacts
  has_many :interaction_flats,:dependent => :destroy
  has_many :flats,:through => :interaction_flats
  accepts_nested_attributes_for :interaction_contacts
  accepts_nested_attributes_for :interaction_flats
end
