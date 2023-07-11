class MultipleChoiceJudgement < ApplicationRecord
  belongs_to :multiple_choice_challenger
  belongs_to :multiple_choice_question
  enum judgement: {
    correct: 0,
    incorrect: 1
  }
end
