class DealContact < ActiveRecord::Base
  belongs_to :deal
  belongs_to :deal_relation

end
