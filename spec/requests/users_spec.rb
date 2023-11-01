require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users'
    end
    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end

    it 'renders the correct view' do
      assert_select 'h1', 'lists of users'
    end
  end

  describe 'GET /users/:user_id' do
    before(:each) do
      get '/users/:user_id'
    end
    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/show')
    end

    it 'renders the correct view' do
      assert_select 'h1', 'The  specific user'
    end
  end
end
