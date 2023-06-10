class IncorrectQuestion < ApplicationRecord
  belongs_to :multiple_choice_challenger
  belongs_to :multiple_choice_question
end
