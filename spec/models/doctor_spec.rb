# /spec/model/recip_spec.rb
require 'rails_helper'

RSpec.describe Doctor, type: :model do
  doctor = Doctor.new(name: 'John Doe', profile_pic: "https://robohash.org/doctor.png?size=300x300&set=set1", 
    bio: "Quod veritatis vel. Ipsa molestiae harum. Sunt dolorem earum.",
     specialization: "Sales", consultation_fee: "31.79")
  before { doctor.save }

#   recipe = Recipe.new(user:, name: 'Recipe 1', description: 'Recipe 1 description', cooking_time: 1,
#                       preparation_time: 1, public: true)
#   before { recipe.save }

  it 'is valid with valid attributes' do
    expect(doctor).to be_valid
  end

  it 'is not valid without a name' do
    doctor.name = nil
    expect(doctor).to_not be_valid
  end

#   it 'is not valid with a name less than 3 characters' do
#     doctor.name = 'ab'
#     expect(doctor).to_not be_valid
#   end

  it 'is not valid with a name more than 200 characters' do
    doctor.name = 'a' * 201
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a profile picture' do
    doctor.profile_pic = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a bio' do
    doctor.bio = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid with a bio more than 1000 characters' do
    doctor.bio = 'a' * 1001
    expect(doctor).to_not be_valid
  end


  it 'is not valid without a specialization' do
    doctor.specialization = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid with a specialization more than 100 characters' do
    doctor.specialization = 'a' * 101
    expect(doctor).to_not be_valid
  end

  it 'is valid without consultation fee' do
    doctor.consultation_fee = nil
    expect(doctor).to_not be_valid
  end
end
