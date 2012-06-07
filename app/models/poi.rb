class Poi < ActiveRecord::Base
  belongs_to :locality
  belongs_to :poi_type
end
