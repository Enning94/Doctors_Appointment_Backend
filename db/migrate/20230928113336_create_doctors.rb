class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :profile_pic
      t.text :bio
      t.string :specialization
      t.decimal :consultation_fee
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
