require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :category => nil,
      :score => 1,
      :user => nil
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input#lesson_category_id[name=?]", "lesson[category_id]"

      assert_select "input#lesson_score[name=?]", "lesson[score]"

      assert_select "input#lesson_user_id[name=?]", "lesson[user_id]"
    end
  end
end
