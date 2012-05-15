class City < ActiveRecord::Base
  has_many :areas, :dependent => :destroy
end
