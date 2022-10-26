require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/calculator/index"
      expect(response).to have_http_status(:success)
    end
  end

end
