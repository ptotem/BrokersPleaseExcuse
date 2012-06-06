class Balcony < ActiveRecord::Base
  belongs_to :flat
  belongs_to :balcony_type
end
