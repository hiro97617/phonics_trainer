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
      :multiple_choice_question_body, :choice1, :choice2, :choice3, :level_part_id,
      :image_for_choice1, :image_for_choice_1_cache, :image_for_choice2, :image_for_choice_2_cache,
      :image_for_choice3, :image_for_choice_3_cache, :is_answer1, :is_answer2, :is_answer3
    )
  end

  def check_multiple_choice
    @multiple_choice = MultipleChoice.find(params[:id])
  end
end
