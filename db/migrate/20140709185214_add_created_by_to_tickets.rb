class AddCreatedByToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :created_by, index: true
  end
end
