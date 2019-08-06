class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :description
      t.string :location
      t.belongs_to :user, foreign_key: true
      t.belongs_to :attendee, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
