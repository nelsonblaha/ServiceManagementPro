class RemoveCreatedByIdFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :created_by_id
  end
end
