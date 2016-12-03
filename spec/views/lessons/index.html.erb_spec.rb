require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        :category => nil,
        :score => 2,
        :user => nil
      ),
      Lesson.create!(
        :category => nil,
        :score => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
