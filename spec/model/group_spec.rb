require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'Tom', email: 'test@gmail.com', password: '1234')
  end

  it 'Should have the image and title attribute' do
    group = Group.create!(name: 'Yoga', description: 'THis is a Yoga class', rating: 2, title: 'sport',
                          image: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png'),
                          user_id: @user.id)

    expect(group).to be_valid
  end

  it 'Should not validate a group/clss creation without the image and/or title attributes' do
    group = Group.create!(name: 'Basketball', description: 'This is the backetball class', rating: 10,
                          title: 'Sport', image: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png'),
                          user_id: @user.id)
    group.title = nil
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
