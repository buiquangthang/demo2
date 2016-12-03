require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :content => "MyString",
      :category => nil
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input#question_content[name=?]", "question[content]"

      assert_select "input#question_category_id[name=?]", "question[category_id]"
    end
  end
end
