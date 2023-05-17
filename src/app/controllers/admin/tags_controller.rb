class Admin::TagsController < Admin::BaseController
  before_action :check_tags, only: %i[edit update destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path
  end

  private

  def check_tags
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:body)
  end
end
