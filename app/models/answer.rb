class Answer < ApplicationRecord
  belongs_to :question

  scope :is_correct?, -> {find_by is_correct: true}
end
