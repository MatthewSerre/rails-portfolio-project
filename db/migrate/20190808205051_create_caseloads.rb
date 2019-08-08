class CreateCaseloads < ActiveRecord::Migration[5.2]
  def change
    create_table :caseloads do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
