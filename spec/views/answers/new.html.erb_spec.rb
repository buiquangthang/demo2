require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :content => "MyString",
      :question => nil,
      :is_correct => false
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_content[name=?]", "answer[content]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_is_correct[name=?]", "answer[is_correct]"
    end
  end
end
