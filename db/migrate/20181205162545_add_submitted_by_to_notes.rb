class AddSubmittedByToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :submitted_by, :string
  end
end
