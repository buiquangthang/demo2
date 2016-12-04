class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :learns

  accepts_nested_attributes_for :learns, :allow_destroy => true
end
