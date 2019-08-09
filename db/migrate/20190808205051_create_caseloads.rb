class CreateCaseloads < ActiveRecord::Migration[5.2]
  def change
    create_table :caseloads do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
