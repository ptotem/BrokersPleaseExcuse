class Service < ActiveRecord::Base
  has_many :building_services
  has_many :buildings, :through => :building_services
end
