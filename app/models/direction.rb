class Direction < ActiveRecord::Base
  has_many :flats, :dependent => :destroy
end
