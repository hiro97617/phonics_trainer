class MultipleChoiceChallenger < ApplicationRecord
  belongs_to :user
  belongs_to :level_part

  has_many :correct_questions
  has_many :incorrect_questions
end