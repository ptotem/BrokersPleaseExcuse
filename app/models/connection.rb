class Connection < ActiveRecord::Base
  belongs_to :contact

  after_create :create_inverse_connection

  def create_inverse_connection
    if Connection.find_by_other_id_and_contact_id_and_relationship(self.contact_id, self.other_id, self.relationship).nil?
      Connection.create!(:other_id => self.contact_id, :contact_id => self.other_id, :relationship => self.relationship)
    end
  end

end
