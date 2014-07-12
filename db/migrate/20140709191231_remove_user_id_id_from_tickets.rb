class RemoveUserIdIdFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :user_id_id
  end
end
