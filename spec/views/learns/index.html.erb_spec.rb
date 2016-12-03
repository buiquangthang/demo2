require 'rails_helper'

RSpec.describe "learns/index", type: :view do
  before(:each) do
    assign(:learns, [
      Learn.create!(
        :question => nil,
        :answer => nil,
        :lesson => nil,
        :is_correct => false
      ),
      Learn.create!(
        :question => nil,
        :answer => nil,
        :lesson => nil,
        :is_correct => false
      )
    ])
  end

  it "renders a list of learns" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
