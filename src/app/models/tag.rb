class Tag < ApplicationRecord
  has_many :multiple_choice_question_tags
  has_many :multiple_choice_questions, through: :multiple_choice_question_tags
end
