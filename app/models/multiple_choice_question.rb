class MultipleChoiceQuestion < ApplicationRecord
  belongs_to :level_part
  has_many :multiple_choices, dependent: :destroy
  validates :body, presence: true
  has_many :multiple_choice_question_tags
  has_many :tags, through: :multiple_choice_question_tags
  has_many :multiple_choice_judgements

  def next(level_part)
    level_part.questions.where('id > ?', id).order('id ASC').first
  end
end
