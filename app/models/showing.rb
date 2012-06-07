class Showing < ActiveRecord::Base
  belongs_to :flat
  belongs_to :task
end
