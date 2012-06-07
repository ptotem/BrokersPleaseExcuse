class AddQknoteToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :qknote, :text

  end
end
