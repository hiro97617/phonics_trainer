class Admin::LessonsController < Admin::BaseController
  before_action :set_level_part, only: %i[index new create]
  before_action :set_lesson, only: %i[edit update destroy]

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
    @lesson = @level_part.lessons.build(lesson_params)
    @lesson.points.split(',')
    if @lesson.save
      redirect_to admin_level_part_lessons_path(@level_part)
    else
      render :edit
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @embed = Embed.new
    @embeds = @lesson.embeds.order(created_at: :desc)
  end

  def edit
    @lesson.points = @lesson.points.join(',')
  end

  def update
    if @lesson.update(lesson_params)
      @lesson.points = @lesson.points.split(',')
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
    params.require(:lesson).permit(:title, :description, :points, :audio, :alphabet_name, :vibrate).merge(level_part_id: params[:level_part_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_level_part
    @level_part = LevelPart.find(params[:level_part_id])
  end
end
