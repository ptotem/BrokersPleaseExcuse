class AddFurnstatToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :furnstat_id, :integer
    add_column :flats, :flatype_id, :integer

  end
end
