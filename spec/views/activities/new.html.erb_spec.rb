require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :content => "MyString",
      :user => nil,
      :type => 1,
      :type_id => 1
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_content[name=?]", "activity[content]"

      assert_select "input#activity_user_id[name=?]", "activity[user_id]"

      assert_select "input#activity_type[name=?]", "activity[type]"

      assert_select "input#activity_type_id[name=?]", "activity[type_id]"
    end
  end
end
