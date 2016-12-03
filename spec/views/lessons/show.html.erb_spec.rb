require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :category => nil,
      :score => 2,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
