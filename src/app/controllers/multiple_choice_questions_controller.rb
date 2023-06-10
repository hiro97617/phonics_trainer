class MultipleChoiceQuestionsController < ApplicationController

  def top
    @level_parts = LevelPart.all
  end

  #ユーザーの記録が行われる
  def start_page; end

  def start
    @level_part = LevelPart.find(params[:level_part_id])
    @multiple_choice_challenger = current_user.multiple_choice_challengers.create(level_part_id: @level_part.id, start_date: Time.current, score: 0)
    redirect_to level_part_multiple_choice_questions_path(@level_part)
  end

  def index
    @level_part = LevelPart.find(params[:level_part_id])
    @multiple_choice_questions = @level_part.multiple_choice_questions.includes(:level_part)
    @multiple_choice_challenger = current_user.multiple_choice_challengers.where(level_part_id: @level_part.id).last
  end

  def finish
    @level_part = LevelPart.find(params[:level_part_id])
    @next_part = LevelPart.find_by(level: @level_part.level, part: @level_part.part + 1)
    @multiple_choice_questions = @level_part.multiple_choice_questions.includes(:level_part)
    @multiple_choice_challenger = current_user.multiple_choice_challengers.where(level_part_id: @level_part.id).last
    @multiple_choice_challenger.update_columns(finish_date: Time.current)
  end
end
