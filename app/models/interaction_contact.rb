class InteractionContact < ActiveRecord::Base
  belongs_to :interaction
  belongs_to :contact
end
