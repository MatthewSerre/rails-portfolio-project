class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :location
      t.belongs_to :user, foreign_key: true
      t.belongs_to :attendee, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
