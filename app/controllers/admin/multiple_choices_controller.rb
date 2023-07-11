class Admin::MultipleChoicesController < Admin::BaseController
  def index; end

  def new; end

  def create; end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def multiple_choice_questions_params
    params.require(:register_multiple_choice_question_form).permit(
      :multiple_choice_question_body, :level_part_id, :correct_choice, :incorrect_choice_1, :incorrect_choice_2,
      :image_for_correct_choice, :image_cache_for_correct_choice, :image_for_incorrect_choice_1,
      :image_cache_for_incorrect_choice_1, :image_for_incorrect_choice_2, :image_cache_for_incorrect_choice_2
    )
  end

  def check_multiple_choice
    @multiple_choice = MultipleChoice.find(params[:id])
  end
end
