module CategoriesHelper
  def quantity_of_question(category_id)
    Category.find(category_id).questions.count
  end

  def your_result(category_id)
    lessons = get_lesson_belongsto_user(category_id)
    result = 0
    if lessons.nil?
      return result
    else
      lessons.each do |lesson|
        result = result + lesson.learns.where(is_correct: true).count
      end
    end
    return result
  end

  def finished?(category_id)
    if quantity_of_question(category_id) == your_result(category_id)
      return true
    end
    return false
  end

  def get_lesson_belongsto_user(category_id)
    Lesson.where(category_id: category_id, user_id: current_user.id)
  end
end
