require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(
    name: 'John Doe',
    username: 'johndoe',
    email: 'johndoe@example.com',
    password: 'password123'
  )

  before { user.save }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate username' do
    duplicate_user = user.dup
    expect(duplicate_user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    duplicate_user = user.dup
    expect(duplicate_user).to_not be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a short password' do
    user.password = 'short'
    expect(user).to_not be_valid
  end
end
