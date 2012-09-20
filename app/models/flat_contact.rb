class FlatContact < ActiveRecord::Base
  belongs_to :flat
  belongs_to :contact
  belongs_to :labelling
  belongs_to :rent_year

  after_create :add_labelling
  after_save :add_labelling

  def add_labelling
    unless self.contact.nil?
      unless self.contact.labellings.include?(self.labelling)
        self.contact.labellings<<self.labelling
      end
    end
  end

end
