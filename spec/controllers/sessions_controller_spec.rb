require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before {get :new}
  let(:user) {FactoryGirl.create :user}
  describe "GET #new" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "login with invalid information" do
    it "Email isn't exist" do
      user.email = "abc@gmail.com"
      login(user.email, user.password)
      expect(response).to render_template(:new)
    end
    it "should not work and go back login form" do
      expect(response).to render_template(:new)
      post :create, params: {session: {
        email: "",
        password: ""
      } }
      expect(response).to render_template(:new)
      expect(flash).to have_at_least(1).items
      get :new
      expect(flash).to be_empty
    end
  end
end
