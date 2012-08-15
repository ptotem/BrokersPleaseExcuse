class BhkConfig < ActiveRecord::Base
  has_many :flats, :dependent => :destroy
  has_many :searching_bhk_configs, :dependent => :destroy
end
