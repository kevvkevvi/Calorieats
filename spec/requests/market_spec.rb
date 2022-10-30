require 'rails_helper'

RSpec.describe "Market", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/market/index"
      expect(response).to have_http_status(:success)
    end
  end

end