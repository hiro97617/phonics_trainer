class IncorrectQuestionsController < ApplicationController
  def create
    @multiple_choice_challenger = MultipleChoiceChallenger.where(user_id: current_user.id).last
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    @multiple_choice_challenger.incorrect_questions.create(multiple_choice_question_id: @multiple_choice_question.id)
  end
end
