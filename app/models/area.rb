class Area < ActiveRecord::Base
  belongs_to :city
  has_many :localities, :dependent => :destroy
  has_many :searching_areas, :dependent => :destroy

end
