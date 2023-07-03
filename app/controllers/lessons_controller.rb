class LessonsController < ApplicationController

  def top
    @level_parts = LevelPart.all
  end

  def index
    @level_part = LevelPart.find(params[:level_part_id])
    @lessons = @level_part.lessons.includes(:level_part)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
