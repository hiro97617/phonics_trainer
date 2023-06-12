class Admin::MultipleChoiceQuestionsController < Admin::BaseController
  before_action :check_multiple_choice_question, only: %i[show edit update destroy]

  def top
    @level_parts = LevelPart.all
  end

  def index
    @level_part = LevelPart.find(params[:level_part_id])
    @multiple_choice_questions = @level_part.multiple_choice_questions.include(:level_part)
  end

  def new
    @level_part = LevelPart.find(params[:level_part_id])
    @register_multiple_choice_question_form = RegisterMultipleChoiceQuestionForm.new
  end

  def create
    @register_multiple_choice_question_form = RegisterMultipleChoiceQuestionForm.new(create_multiple_choice_question_params)
    @register_multiple_choice_question_form.level_part_id = params[:level_part_id]
    if @register_multiple_choice_question_form.save
      redirect_to admin_multiple_choice_questions_path
    else
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
      :multiple_choice_question_body, :choice_1, :choice_2, :choice_3, :level_part_id,
      :image_for_choice_1, :image_for_choice_1_cache, :image_for_choice_2, :image_for_choice_2_cache,
      :image_for_choice_3, :image_for_choice_3_cache, :is_answer_1, :is_answer_2, :is_answer_3
    )
  end

  def check_multiple_choice_question
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
  end
end
