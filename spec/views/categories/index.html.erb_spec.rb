require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :name => "Name",
        :picture => "Picture"
      ),
      Category.create!(
        :name => "Name",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
