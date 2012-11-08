class PrimaryLocality < ActiveRecord::Base
  belongs_to :building
  belongs_to :locality
end
