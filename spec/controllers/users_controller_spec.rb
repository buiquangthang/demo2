require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "signing up with invalid information" do
    it "should not work and should go back to the signup form" do
      get :new
      expect do
        post :create, user: { 
          name:                  "",
          email:                 "user@triculi",
          password:              "buajaja",
          password_confirmation: "juababa" 
        }
      end.to change{ User.count }.by(0)
      expect(response).to render_template(:new)
    end
  end

  describe "signing up with valid information" do
    it "should work and should redirect to user's show view" do
      get :new
      expect do
        post :create, user: { 
          name:                  "Triculi",
          email:                 "triculito@mail.com",
          password:              "worldtriculi",
          password_confirmation: "worldtriculi"
        }
      end.to change{ User.count }.from(0).to(1)
      expect(response).to redirect_to(action: :home, controller: :static_pages)
      expect(flash[:info]).to have_at_least(1).items
    end
  end
end
