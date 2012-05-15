class Contact < ActiveRecord::Base

  belongs_to :rltn

  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :task_actions
  has_and_belongs_to_many :labellings

  has_many :connections, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy
  has_many :contact_notes, :dependent => :destroy
  has_many :deals, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :flat_contacts, :dependent => :destroy
  has_many :flats, :through => :flat_contacts

  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:email].blank? }
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:phone].blank? }
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:address].blank? }
  accepts_nested_attributes_for :contact_notes

  accepts_nested_attributes_for :connections, :reject_if => lambda { |a| a[:other_id].blank? } , :allow_destroy => true

end
