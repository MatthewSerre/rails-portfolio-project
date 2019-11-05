class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :caseload_id, default: 0
      t.belongs_to :caseload, foreign_key: true, default: 0

      t.timestamps
    end
  end
end
