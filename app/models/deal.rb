class Deal < ActiveRecord::Base
  belongs_to :flat
  belongs_to :contact
end
