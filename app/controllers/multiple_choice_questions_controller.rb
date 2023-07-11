class MultipleChoiceQuestionsController < ApplicationController
  before_action :find_level_part, only: %i[new create index show update result_page]
  before_action :find_multiple_choice_challenger, only: %i[show update result_page]

  def top
    @level_parts = LevelPart.all
  end

  def index
    @multiple_choice_questions = @level_part.multiple_choice_questions.includes(:level_part)
    @multiple_choice_challenger = current_user.multiple_choice_challengers.where(level_part_id: @level_part.id).last
  end

  #ユーザーの記録が行われる
  def new; end

  def create
    @multiple_choice_challenger = current_user.multiple_choice_challengers.create(level_part_id: @level_part.id, start_date: Time.current, score: 0)
    redirect_to level_part_multiple_choice_question_path(@level_part, @level_part.multiple_choice_questions.first)
  end

  def show
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
  end

  def answer
    @multiple_choice_challenger = MultipleChoiceChallenger.where(user_id: current_user.id).last
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:multiple_choice_question_id])
    @judgement = MultipleChoiceJudgement.find_by(multiple_choice_challenger_id: @multiple_choice_challenger.id, multiple_choice_question_id: @multiple_choice_question.id)
    @level_part = @multiple_choice_question.level_part
    @next = @level_part.multiple_choice_questions.find_by(id: @multiple_choice_question.id + 1)
  end

  def update
    @multiple_choice_challenger.update_columns(finish_date: Time.current)
    redirect_to level_part_multiple_choice_result_path(@level_part)
  end

  def result_page
    @next_part = LevelPart.find_by(level: @level_part.level, part: @level_part.part + 1)
    @next_level = LevelPart.find_by(level: @level_part.level + 1, part: 1)
  end

  private

  def find_level_part
    @level_part = LevelPart.find(params[:level_part_id])
  end

  def find_multiple_choice_challenger
    @multiple_choice_challenger = current_user.multiple_choice_challengers.where(level_part_id: @level_part.id).last
  end
end
