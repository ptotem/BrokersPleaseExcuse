class AddQknoteToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :qknote, :text

  end
end
