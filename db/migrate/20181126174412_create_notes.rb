class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :date
      t.text :content

      t.timestamps
    end
  end
end
