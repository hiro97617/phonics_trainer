class Admin::EmbedsController < Admin::BaseController
  before_action :set_lesson, only: %i[create]
  before_action :set_embed, only: %i[update destroy]

  def create
    @embed = @lesson.embeds.build(embed_params)
    @embed.extract_id_from_url
    if @embed.save
      redirect_to admin_lesson_path(@lesson), success: t('defaults.message.created', item: Embed.model_name.human)
    else
      redirect_to admin_lesson_path(@lesson), danger: t('defaults.message.not_created', item: Embed.model_name.human)
    end
  end

  def update; end

  def destroy
    @embed.destroy!
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_embed
    @embed = Embed.find(params[:id])
  end

  def embed_params
    params.require(:embed).permit(:description, :media_type, :media_url).merge(lesson_id: params[:lesson_id])
  end
end
