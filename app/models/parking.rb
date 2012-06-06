class Parking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :parking_type
end
