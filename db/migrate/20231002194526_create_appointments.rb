class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.datetime :appointment_date, null: false
      t.string :city, null: false
      t.integer :appointment_duration, null: false
      t.decimal :facility_fee, default: 200


      t.timestamps
    end
  end
end
