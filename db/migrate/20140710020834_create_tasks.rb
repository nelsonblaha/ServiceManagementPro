class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.references :ticket, index: true
      t.string :status
      t.text :notification

      t.timestamps
    end
  end
end
