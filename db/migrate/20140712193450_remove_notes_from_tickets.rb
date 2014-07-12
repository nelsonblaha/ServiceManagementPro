class RemoveNotesFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :notes, :string
  end
end
