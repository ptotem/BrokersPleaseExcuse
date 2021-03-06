class Contact < ActiveRecord::Base

  has_one :user

  has_and_belongs_to_many :labellings
  has_and_belongs_to_many :contact_types

  has_many :interaction_contacts
  has_many :interactions, :through => :interaction_contacts
  has_many :connections, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy
  has_many :contact_notes, :dependent => :destroy
  has_many :deal_contacts, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :flat_contacts, :dependent => :destroy
  has_many :flats, :through => :flat_contacts
  has_many :deals, :through => :deal_contacts

  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :contact_notes
  accepts_nested_attributes_for :flat_contacts, :reject_if => proc { |attrs| reject = %w(flat_id contact_id labelling_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  accepts_nested_attributes_for :connections, :reject_if => lambda { |a| !Connection.find_by_other_id_and_relationship_and_contact_id(a[:other_id], a[:relationship], a[:contact_id]).nil? or a[:other_id].blank? or a[:relationship].blank? }, :allow_destroy => true

  validates_presence_of :name
  #validate :email_or_phone


  def email_or_phone
    if emails.size==0 and phones.size==0
      errors.add(:name, "could not be saved as you have to enter either Email or Phone Number")
    end
  end

  def display_name
    if self.phones.first
      [self.name, self.phones.first.name].join("--")
    else
      self.name
    end

  end


end
