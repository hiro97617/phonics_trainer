class MultipleChoiceQuestionTag < ApplicationRecord
  belongs_to :tag
  belongs_to :multiple_choice_question
end
