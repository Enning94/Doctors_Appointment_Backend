require 'swagger_helper'

describe 'Appointments API' do

  path '/api/v1/appointments' do

    post 'Creates an appointment' do
      tags 'Appointments'
      consumes 'application/json', 'application/xml'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          patient_id: { type: :integer},
          doctor_id: { type: :integer},
          appointment_date: {  type: :string, format: :datetime },
          city: { type: :string },
          appointment_duration: { type: :integer },
          facility_fee: { type: :number }
        },
      }
      response '201', 'appointment created' do
        let!(:patient) { Patient.create(username: "ank1234", name: "Ank", email: "ank@gmail.com", password: "Abc1234") }
        let!(:doctor) { Doctor.create(name: 'Ankit', profile_pic: 'xyz.ynh', bio: 'I am a doctor',
            specialization: 'Neck surgeon', consultation_fee: 150) }
        
        let(:appointment) do
          {
            id: 13,
            patient_id: patient.id,
            doctor_id: doctor.id,
            appointment_date: "2023-10-07T03:30:44.709Z",
            city: "Keeleybury",
            appointment_duration: 239,
            facility_fee: "200.0"
          }
        end
        run_test!
      end
    end
end





path '/api/v1/appointments' do
    get 'Retrieve all appointments' do
      tags 'Appointments'
      produces 'application/json'

      response '200', 'Appointments found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                    patient_id: { type: :integer},
                    doctor_id: { type: :integer},
                    appointment_date: {  type: :string, format: :datetime },
                    city: { type: :string },
                    appointment_duration: { type: :integer },
                    facility_fee: { type: :number }
                  }
               }

               response '201', 'appointment created' do
                let!(:patient) { Patient.create(username: "ank1234", name: "Ank", email: "ank@gmail.com", password: "Abc1234") }
                let!(:doctor) { Doctor.create(name: 'Ankit', profile_pic: 'xyz.ynh', bio: 'I am a doctor',
                    specialization: 'Neck surgeon', consultation_fee: 150) }
                
                let(:appointment) do
                  {
                    id: 13,
                    patient_id: patient.id,
                    doctor_id: doctor.id,
                    appointment_date: "2023-10-07T03:30:44.709Z",
                    city: "Keeleybury",
                    appointment_duration: 239,
                    facility_fee: "200.0"
                  }
                end
                run_test!
              end
      end
    end
  end

end
