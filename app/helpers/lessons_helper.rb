module LessonsHelper
  def get_answers(id)
    Question.find(id).answers
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
end
