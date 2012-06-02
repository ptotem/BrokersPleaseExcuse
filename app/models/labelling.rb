class Labelling < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  has_many :flat_contacts,:dependent => :destroy
end
