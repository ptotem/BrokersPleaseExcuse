class ChangeColumnsOfFlatContact < ActiveRecord::Migration
  def up
    rename_column :flat_contacts,:contact_type_id,:labelling_id
  end

  def down
    rename_column :flat_contacts,:labelling_id,:contact_type_id
  end
end
