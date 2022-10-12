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

  it 'Should not accept duplicate email' do
    @invalid_user = @user.dup
    @invalid_user.email = 'test@gmail.com'
    expect(@invalid_user.valid?).to be_truthy
  end

  it 'Should have many groups' do
    assc = described_class.reflect_on_association(:groups)
    expect(assc.macro).to eq :has_many
  end

  it 'Should have many reservations' do
    assc = described_class.reflect_on_association(:reservations)
    expect(assc.macro).to eq :has_many
  end
end
