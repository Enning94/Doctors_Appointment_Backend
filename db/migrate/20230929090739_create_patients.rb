class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :username, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
