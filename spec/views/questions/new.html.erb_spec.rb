require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :content => "MyString",
      :category => nil
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_content[name=?]", "question[content]"

      assert_select "input#question_category_id[name=?]", "question[category_id]"
    end
  end
end
