class InteractionFlat < ActiveRecord::Base
  belongs_to :interaction
  belongs_to :flat
end
