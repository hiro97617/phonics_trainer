class Admin::MultipleChoiceQuestionsController < Admin::BaseController
  before_action :check_multiple_choice_question, only: %i[show edit update destroy]

  def index
  @multiple_choice_questions = MultipleChoiceQuestion.all
  end

  def new
    @level_part = LevelPart.find(params[:level_part_id])
    @register_multiple_choice_question_form = RegisterMultipleChoiceQuestionForm.new
  end

  def create
    binding.pry
    @register_multiple_choice_question_form = RegisterMultipleChoiceQuestionForm.new(create_multiple_choice_question_params)
    binding.pry
    @register_multiple_choice_question_form.level_part_id = params[:level_part_id]
    binding.pry
    if @register_multiple_choice_question_form.save
      binding.pry
      redirect_to admin_multiple_choice_questions_path
    else
      binding.pry
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @multiple_choice_question.update(create_multiple_choice_question_params)
      redirect_to admin_multiple_choice_questions_path
    else
      render :edit
    end
  end

  def destroy
    @multiple_choice_question.destroy!
    redirect_to admin_multiple_choice_questions_path
  end


  private

  def create_multiple_choice_question_params
    params.require(:register_multiple_choice_question_form).permit(
      :multiple_choice_question_body, :correct_choice, :incorrect_choice_1, :incorrect_choice_2,
      :level_part_id, :image_for_correct_choice, :image_for_correct_choice_cache, :image_for_incorrect_choice_1,
      :image_for_incorrect_choice_1_cache, :image_for_incorrect_choice_2, :image_for_incorrect_choice_2_cache)
  end

  def check_multiple_choice_question
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
  end
end
