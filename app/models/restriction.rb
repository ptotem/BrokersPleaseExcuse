class Restriction < ActiveRecord::Base
  has_many :flat_restrictions, :dependent => :destroy
  has_many :flats, :through => :flat_restrictions
  has_and_belongs_to_many :buildings
end
