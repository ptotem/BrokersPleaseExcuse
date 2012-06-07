class InteractionEntity < ActiveRecord::Base
  belongs_to :interaction
  belongs_to :entity
end
