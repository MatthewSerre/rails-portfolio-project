class ChangeClientsCaseloadColumnDefault < ActiveRecord::Migration[5.2]
    def change
        change_column_default(
            :clients,
            :caseload_id,
            0
          )
    end
  end
  


  