class MultipleChoice < ApplicationRecord
  belongs_to :multiple_choice_question
  validates :is_answer, presence: true
  validates :body, presence: true
end
