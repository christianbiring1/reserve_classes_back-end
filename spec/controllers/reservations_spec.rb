require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  before :all do
    @user = User.create(email: 'test1@test.com', name: 'Test1', password: 'test12')
    @group = Group.create(name: 'Grade 1', description: 'This is the description of grade 1',  rating:1, title: "Grade 1 2021", user_id: @user.id, image:Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png'),)
  end
  
  describe 'GET index controller' do
    it 'returns reservations array' do
      get :index, params: { user_id: @user.id }
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
    end
  end
end