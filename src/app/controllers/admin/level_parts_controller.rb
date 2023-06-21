class Admin::LevelPartsController < Admin::BaseController
  before_action :check_level_parts, only: %i[show edit update destroy]

  def index
    @level_parts = LevelPart.all
  end

  def new
    @level_part = LevelPart.new
  end

  def create
    @level_part = LevelPart.new(level_part_params)
    if @level_part.save
      redirect_to admin_level_parts_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @level_part.update(level_part_params)
      redirect_to admin_level_parts_path
    else
      render :edit
    end
  end

  def destroy
    @level_part.destroy
    redirect_to admin_level_parts_path
  end

  private

  def check_level_parts
    @level_part = LevelPart.find(params[:id])
  end

  def level_part_params
    params.require(:level_part).permit(:level, :part, :icon, :icon_cache)
  end
end
