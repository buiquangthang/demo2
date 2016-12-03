require 'rails_helper'

RSpec.describe "learns/show", type: :view do
  before(:each) do
    @learn = assign(:learn, Learn.create!(
      :question => nil,
      :answer => nil,
      :lesson => nil,
      :is_correct => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
