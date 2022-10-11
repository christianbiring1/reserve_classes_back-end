require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it 'Should belong to a user' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'Should belong to a group' do
    assc = described_class.reflect_on_association(:group)
    expect(assc.macro).to eq :belongs_to
  end
end