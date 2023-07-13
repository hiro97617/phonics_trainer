class MultipleChoiceJudgementsController < ApplicationController
  before_action :set_judgement, only: %i[create]

  def create
    if @multiple_choice.is_answer
      @multiple_choice_judgement.correct!
      @multiple_choice_challenger.update_column(:score, @multiple_choice_challenger.score + 1)
    else
      @multiple_choice_judgement.incorrect!
    end
    redirect_to multiple_choice_question_answer_path(@multiple_choice_question)
  end

  private

  def set_judgement
    @multiple_choice_challenger = MultipleChoiceChallenger.where(user_id: current_user.id).last
    @multiple_choice = MultipleChoice.find(params[:multiple_choice_id])
    @multiple_choice_question = MultipleChoiceQuestion.find(@multiple_choice.multiple_choice_question_id)
    @multiple_choice_judgement = @multiple_choice_challenger.multiple_choice_judgements.build(multiple_choice_question_id: @multiple_choice_question.id)
  end
end
