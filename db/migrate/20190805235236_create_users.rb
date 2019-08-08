class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :provider, default: 0
      t.string :uid, default: 0
      t.string :password_digest

      t.timestamps
    end
  end
end
