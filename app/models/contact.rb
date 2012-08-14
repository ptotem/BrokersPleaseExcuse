class Contact < ActiveRecord::Base

  has_one :user

  has_and_belongs_to_many :labellings
  has_and_belongs_to_many :contact_types


  # this is the place where we have over ridden contact_types association method.
  # the reason is it should not throw an error if no associated objects are found
  def contact_types
    types=super
    if types.count==0
      e=ErrorObject.get_error_object(:name, "No Contact Type Found")

      return [e]

    else
      types
    end


  end

  has_many :interaction_contacts
  has_many :interactions, :through => :interaction_contacts
  has_many :connections, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy
  has_many :contact_notes, :dependent => :destroy
  has_many :deals, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :flat_contacts, :dependent => :destroy
  has_many :flats, :through => :flat_contacts

  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :contact_types, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :contact_notes
  accepts_nested_attributes_for :flat_contacts, :reject_if => proc { |attrs| reject = %w(flat_id contact_id labelling_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  accepts_nested_attributes_for :connections, :reject_if => lambda { |a|  !Connection.find_by_other_id_and_relationship_and_contact_id(a[:other_id], a[:relationship],a[:contact_id]).nil? or a[:other_id].blank? or a[:relationship].blank? }, :allow_destroy => true

  validates_presence_of :name
  #TODO:check the validation of email or phone. Not working in seeds
  #validate :email_or_phone

  def email_or_phone
    if emails.size==0 and phones.size==0
      errors.add(:name, "could not be saved as you have to enter either Email or Phone Number")
    end
  end

  def display_name
    [self.name,self.phones.first.name].join("--")
  end


end
