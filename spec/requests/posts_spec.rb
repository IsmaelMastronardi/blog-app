require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    before(:each) do
      get "/users/:user_id/posts"
    end
    it "returns http success" do
      expect(response.status).to eq(200)
    end

    it "renders the correct template" do
      expect(response).to render_template('posts/index')
    end

    it "renders the correct view" do
      assert_select "h1", "List of posts"
    end
  end

  describe "GET /users/:user_id/posts/:post_id" do
    before(:each) do
      get "/users/:user_id/posts/:posts_id"
    end
    it "returns http success" do
      expect(response.status).to eq(200)
    end

    it "renders the correct template" do
      expect(response).to render_template('posts/show')
    end

    it "renders the correct view" do
      assert_select "h1", "specific post"
    end
  end
end
