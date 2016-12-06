class Learn < ApplicationRecord
  belongs_to :question
  belongs_to :answer, optional: true
  belongs_to :lesson

  scope :learned_ids, -> (user_id, category_id){
    current_user = User.find(user_id)
    lesson_ids = current_user.lessons.where(category_id: category_id)
    learned_ids = [0]
    lesson_ids.each do |lesson|
      lesson.learns.where(is_correct: true).each do |learn|
        learned_ids << learn.question_id
      end
    end
    return learned_ids
  }

  def self.correct?(answer_id)
    if answer_id.nil?
      return false
    else
      Answer.find(answer_id).is_correct
    end
  end
end
