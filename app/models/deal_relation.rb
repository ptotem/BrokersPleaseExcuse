class DealRelation < ActiveRecord::Base
  has_many :deal_contacts,:dependent => :destroy

end
