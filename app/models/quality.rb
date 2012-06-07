class Quality < ActiveRecord::Base
  has_many :approach_qualities, :dependent => :destroy
  has_many :building_qualities, :dependent => :destroy
  has_many :interiors_qualities, :dependent => :destroy
  has_many :view_qualities, :dependent => :destroy
  has_many :localities, :dependent => :destroy
end
