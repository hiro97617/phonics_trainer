class MultipleChoiceChallenger < ApplicationRecord
  belongs_to :user
  belongs_to :level_part

  has_many :multiple_choice_judgements
end