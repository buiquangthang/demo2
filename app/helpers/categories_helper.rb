module CategoriesHelper
  def quantity_of_question(category)
    Category.find(category.id).questions.count
  end

  def your_result(category)
    lessons = category.lessons.get_lesson_belongsto_user(current_user.id)
    result = 0
    if lessons.nil?
      return result
    else
      lessons.each do |lesson|
        result = result + lesson.learns.is_correct?.count
      end
    end
    return result
  end

  def is_finished?(category_id)
    quantity_of_question(category_id) == your_result(category_id) ? true : false
  end
end
