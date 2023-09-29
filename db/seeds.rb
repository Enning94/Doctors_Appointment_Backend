# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seed_data.rb

# Create 10 doctors
10.times do
    Doctor.create!(
      name: Faker::Name.name,
      profile_pic: Faker::Avatar.image(slug: 'doctor', size: '300x300', format: 'png'), # Generates a random avatar image link
      bio: Faker::Lorem.paragraph,
      specialization: Faker::Job.field,
      consultation_fee: Faker::Number.decimal(l_digits: 2),
    )
  end
  
  # Create 10 patients
  10.times do
    Patient.create!(
      username: Faker::Internet.username,
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password', # You can use a secure method for password hashing
    )
  end
  
  # Create 10 appointments, associating random patients and doctors
  10.times do
    Appointment.create!(
      patient: Patient.all.sample,
      doctor: Doctor.all.sample,
      appointment_date: Faker::Time.between(from: DateTime.now, to: 1.year.from_now),
      city: Faker::Address.city,
      appointment_duration: Faker::Number.between(from: 30, to: 240),
      # facility_fee: Faker::Number.decimal(l_digits: 2),
    )
  end
  