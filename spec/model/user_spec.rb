require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom', email: 'test@gmail.com', password: '1234')
  end

  it 'Should be valid' do
    @user.save
    expect(@user).to be_valid
  end

  it 'Should have an email address' do
    @user.email = nil
    @user.save
    expect(@user).to_not be_valid
  end

  it 'Should accept only a unique mail address' do
    @user2 = User.create!(name: 'Marry', email: 'test@gmail.com', password: '2345')
    # @user2.save!
    expect(@user2).not_to be_valid
  end
end