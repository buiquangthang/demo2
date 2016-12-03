require 'rails_helper'

RSpec.describe "learns/edit", type: :view do
  before(:each) do
    @learn = assign(:learn, Learn.create!(
      :question => nil,
      :answer => nil,
      :lesson => nil,
      :is_correct => false
    ))
  end

  it "renders the edit learn form" do
    render

    assert_select "form[action=?][method=?]", learn_path(@learn), "post" do

      assert_select "input#learn_question_id[name=?]", "learn[question_id]"

      assert_select "input#learn_answer_id[name=?]", "learn[answer_id]"

      assert_select "input#learn_lesson_id[name=?]", "learn[lesson_id]"

      assert_select "input#learn_is_correct[name=?]", "learn[is_correct]"
    end
  end
end
