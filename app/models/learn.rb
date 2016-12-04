class Learn < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :lesson

  def self.correct?(answer_id)
    Answer.find(answer_id).is_correct
  end
end
