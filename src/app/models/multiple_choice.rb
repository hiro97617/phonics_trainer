class MultipleChoice < ApplicationRecord
  belongs_to :multiple_choice_question
  validates :is_answer, inclusion: [true, false]
  validates :body, presence: true
  has_one_attached :image
end
