require 'rails_helper'

RSpec.describe "learns/new", type: :view do
  before(:each) do
    assign(:learn, Learn.new(
      :question => nil,
      :answer => nil,
      :lesson => nil,
      :is_correct => false
    ))
  end

  it "renders new learn form" do
    render

    assert_select "form[action=?][method=?]", learns_path, "post" do

      assert_select "input#learn_question_id[name=?]", "learn[question_id]"

      assert_select "input#learn_answer_id[name=?]", "learn[answer_id]"

      assert_select "input#learn_lesson_id[name=?]", "learn[lesson_id]"

      assert_select "input#learn_is_correct[name=?]", "learn[is_correct]"
    end
  end
end
