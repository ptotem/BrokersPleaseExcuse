class FlatContact < ActiveRecord::Base
  belongs_to :flat
  belongs_to :contact
  belongs_to :contact_type
  belongs_to :rent_year
end
