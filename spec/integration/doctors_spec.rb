require 'swagger_helper'

describe 'Doctors API' do

  path '/api/v1/doctors' do

    post 'Creates a doctor' do
      tags 'Doctors'
      consumes 'application/json', 'application/xml'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          profile_pic: { type: :string },
          bio: { type: :string },
          specialization: { type: :string },
          consultation_fee: { type: :number }
        },
      }
      response '201', 'doctor created' do
        let(:doctor) { {name: 'Ankit', profile_pic: 'xyz.ynh', bio: 'I am a doctor',
            specialization: 'Neck surgeon', consultation_fee: 150} }
        run_test!
      end
    end
end


  path '/api/v1/doctors/{id}' do

    get 'Retrieves a doctor' do
      tags 'Doctors'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'Doctor found' do
        schema type: :object,
          properties: {
            name: { type: :string },
            profile_pic: { type: :string },
            bio: { type: :string },
            specialization: { type: :string },
            consultation_fee: { type: :number }
          }

          let(:id) { Doctor.create(name: 'Ankit', profile_pic: 'xyz.ynh', bio: 'I am a doctor',
            specialization: 'Neck surgeon', consultation_fee: 150).id }
          run_test!
        end
        end
end
 
path '/api/v1/doctors' do
    get 'Retrieves all doctors' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'Doctors found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   name: { type: :string },
                   profile_pic: { type: :string },
                   bio: { type: :string },
                   specialization: { type: :string },
                   consultation_fee: { type: :number }
                 }
               }

               let(:id) { Doctor.create(name: 'Ankit', profile_pic: 'xyz.ynh', bio: 'I am a doctor',
                specialization: 'Neck surgeon', consultation_fee: 150).id }
               run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    delete 'Deletes a doctor' do
      tags 'Doctors'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string
end
end
end




