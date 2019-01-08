class AddLikesToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :likes, :integer, :default => 0
  end
end
