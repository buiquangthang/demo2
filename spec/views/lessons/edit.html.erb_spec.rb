require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :category => nil,
      :score => 1,
      :user => nil
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input#lesson_category_id[name=?]", "lesson[category_id]"

      assert_select "input#lesson_score[name=?]", "lesson[score]"

      assert_select "input#lesson_user_id[name=?]", "lesson[user_id]"
    end
  end
end
