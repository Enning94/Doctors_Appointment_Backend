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
          consultation_fee: { type: :integer },
          status: { type: :string }
        },
      }
 

    #   response '201', 'doctor created' do
    #     let(:doctor) { { name: 'John Doe', profile_pic: 'https://robohash.org/doctor.png?size=300x300&set=set1',
    #         bio: 'Quod veritatis vel. Ipsa molestiae harum. Sunt dolorem earum.',
    #         specialization: 'Sales', consultation_fee: '31.79' } }
    #     run_test!
    #   end


#       response '422', 'invalid request' do
#         let(:doctor) { { name: 'foo' } }
#         run_test!
#       end
#     end
#   end

# #   path '/api/v1/pets/{id}' do

# #     get 'Retrieves a pet' do
# #       tags 'Pets'
# #       produces 'application/json', 'application/xml'
# #       parameter name: :id, :in => :path, :type => :string

# #       response '200', 'name found' do
# #         schema type: :object,
# #           properties: {
# #             id: { type: :integer, },
# #             name: { type: :string },
# #             photo_url: { type: :string },
# #             status: { type: :string }
# #           },
# #           required: [ 'id', 'name', 'status' ]

# #         let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
# #         run_test!
# #       end

# #       response '404', 'pet not found' do
# #         let(:id) { 'invalid' }
# #         run_test!
# #       end
# #     end
# #   end
