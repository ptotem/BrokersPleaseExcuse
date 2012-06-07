class AddQknoteToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :qknote, :text

  end
end
