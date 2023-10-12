class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.binary :profile_pic, null: false
      t.text :bio, null: false
      t.string :specialization, null: false
      t.decimal :consultation_fee, null: false

      t.timestamps
    end
  end
end
