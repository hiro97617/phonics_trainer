class Admin::LessonsController < ApplicationController
  before_action :set_level_part, only: %i[index new create]
  before_action :set_lesson, only: %i[show edit update destroy]

  def top
    @level_parts = LevelPart.all
  end

  def index
    @lessons = @level_part.lessons.includes(:level_part)
  end

  def new
    @lesson = @level_part.lessons.new
  end

  def create
    @lesson = @level_part.lessons.new(lesson_params)
    if @lesson.save
      redirect_to admin_lessons_path(@level_part)
    else
      render :edit
    end
  end

  def show; end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_level_part_lessons_path, success: t('defaults.message.update', item: Lesson.human_model.attribute)
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy!
    flash.now[:success] = t('defaults.message.delete', item: Lesson.human_model.attribute )
    redirect_to admin_lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:phoneme, :content).merge(level_part_id: params[:level_part_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_level_part
    @level_part = LevelPart.find(params[:level_part_id])
  end
end
