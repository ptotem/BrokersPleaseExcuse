class AddDisplayedToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :displayed, :boolean, :default=>false
    add_column :flats, :approved, :boolean, :default=>false

  end
end
