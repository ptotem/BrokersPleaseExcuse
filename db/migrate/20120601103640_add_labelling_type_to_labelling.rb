class AddLabellingTypeToLabelling < ActiveRecord::Migration
  def change
    add_column :labellings, :is_flat_contact_label, :boolean

  end
end
