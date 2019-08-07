class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :date
      t.integer :length_in_minutes
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
