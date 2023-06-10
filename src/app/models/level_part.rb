class LevelPart < ApplicationRecord
has_many :multiple_choice_questions, dependent: :destroy
has_many :multiple_choice_challengers

  validates :level, presence: true
  validates :part, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[level, part]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
