class AddPrimaryContactIdToInteraction < ActiveRecord::Migration
  def change
    add_column :interactions, :primary_contact_id, :integer

  end
end
