class BalconyType < ActiveRecord::Base
  has_many :balconies, :dependent => :destroy
end
