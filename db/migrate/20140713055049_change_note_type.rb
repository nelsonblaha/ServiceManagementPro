class ChangeNoteType < ActiveRecord::Migration
  def change
    rename_column :notes, :type, :categorization
  end
end
