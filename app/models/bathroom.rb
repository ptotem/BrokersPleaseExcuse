class Bathroom < ActiveRecord::Base
  belongs_to :flat
  belongs_to :bathroom_type
end
