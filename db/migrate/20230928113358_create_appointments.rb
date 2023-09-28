class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.datetime :appointment_date
      t.integer :appointment_duration
      t.decimal :facility_fee

      t.timestamps
    end
  end
end
