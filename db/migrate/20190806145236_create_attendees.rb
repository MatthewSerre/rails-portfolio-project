class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
