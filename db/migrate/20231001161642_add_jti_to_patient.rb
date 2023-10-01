class AddJtiToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :jti, :string, null: false
    add_index :patients, :jti, unique: true
  end
end
