require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'Tom', email: 'test@gmail.com', password: '1234')
  end

  it 'Should have the image and title attribute' do
    group = Group.create!(image: 'https://unsplash/image.com', title: 'Sport', user_id: @user.id)
    group.image = nil
    expect(group).to_not be_valid
  end
  it 'Should belong to a user' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'Should have many reservations' do
    assc = described_class.reflect_on_association(:reservations)
    expect(assc.macro).to eq :has_many
  end
end
