class Learn < ApplicationRecord
  belongs_to :question
  belongs_to :answer, optional: true
  belongs_to :lesson

  def self.correct?(answer_id)
    if answer_id.nil?
      return false
    else
      Answer.find(answer_id).is_correct
    end
  end
end
