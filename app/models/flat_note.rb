class FlatNote < ActiveRecord::Base
  belongs_to :flat
  validates_uniqueness_of :name
end
