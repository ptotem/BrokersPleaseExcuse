class InteriorsQuality < ActiveRecord::Base
  belongs_to :flat
  belongs_to :quality
  validates_uniqueness_of :flat_id
end
