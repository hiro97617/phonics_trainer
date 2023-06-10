class CorrectQuestion < ApplicationRecord
  belongs_to :multiple_choice_challenger
  belongs_to :multiple_choice_question

  def add_score(multiple_choice_challenger)
    binding.pry
    multiple_choice_challenger = MultipleChoiceChallenger.find(params[:id]).last
    new_score = multiple_choice_challenger.score.to_i + 1
    multiple_choice_challenger.update_column(:score, new_score.to_i)
  end
end
