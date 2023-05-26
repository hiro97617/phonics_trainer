class Admin::MultipleChoicesController < Admin::BaseController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def multiple_choice_questions_params
    params.require(:register_multiple_choice_question_form).permit(
      :multiple_choice_question_body, :correct_choice,
      :incorrect_choice_1, :incorrect_choice_2, :level_part_id)
  end


  def check_multiple_choice
    @multiple_choice = MultipleChoice.find(params[:id])
  end
end
end
