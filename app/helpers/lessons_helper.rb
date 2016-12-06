module LessonsHelper
  def get_answers(id)
    answers = []
    Question.find(id).answers.each do |answer|
      answers << answer
    end
    answers.shuffle
  end

  def get_question(id)
    Question.find(id).content
  end

  def your_answer(id)
    if id.nil?
      return ""
    else
      Answer.find(id).content
    end
  end

  def correct_answer(id)
    Answer.find_by(question_id: id, is_correct: true).content
  end

  def get_learned(category_id)
    lesson_ids = current_user.lessons.where(category_id: category_id)
    @learned_ids = [0]
    lesson_ids.each do |lesson|
      lesson.learns.where(is_correct: true).each do |learn|
        @learned_ids << learn.question_id
      end
    end
  end
end
