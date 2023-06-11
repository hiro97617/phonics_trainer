class MultipleChoiceQuestion < ApplicationRecord
  belongs_to :level_part
  has_many :multiple_choices, dependent: :destroy
  validates :body, presence: true
  has_many :multiple_choice_question_tags
  has_many :tags, through: :multiple_choice_question_tags
  has_many :correct_questions
  has_many :incorrect_questions

  def get_id(multiple_choice_questions)
    multiple_choice_questions.each do | question |
      gon.id = question.id
    end
  end
end
