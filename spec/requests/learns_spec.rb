require 'rails_helper'

RSpec.describe "Learns", type: :request do
  describe "GET /learns" do
    it "works! (now write some real specs)" do
      get learns_path
      expect(response).to have_http_status(200)
    end
  end
end
