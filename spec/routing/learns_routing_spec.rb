require "rails_helper"

RSpec.describe LearnsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/learns").to route_to("learns#index")
    end

    it "routes to #new" do
      expect(:get => "/learns/new").to route_to("learns#new")
    end

    it "routes to #show" do
      expect(:get => "/learns/1").to route_to("learns#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/learns/1/edit").to route_to("learns#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/learns").to route_to("learns#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/learns/1").to route_to("learns#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/learns/1").to route_to("learns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/learns/1").to route_to("learns#destroy", :id => "1")
    end

  end
end
