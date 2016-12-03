require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :content => "Content",
        :user => nil,
        :type => 2,
        :type_id => 3
      ),
      Activity.create!(
        :content => "Content",
        :user => nil,
        :type => 2,
        :type_id => 3
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
