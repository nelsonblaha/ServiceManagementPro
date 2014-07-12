class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :customernetid
      t.string :customermavid
      t.string :customername
      t.string :customerphone
      t.string :customeremail
      t.boolean :problem
      t.string :category
      t.text :resolution
      t.text :notes

      t.timestamps
    end
  end
end
