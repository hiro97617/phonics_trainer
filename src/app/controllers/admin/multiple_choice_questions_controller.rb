class Admin::MultipleChoiceQuestionsController < Admin::BaseController
  before_action :check_multiple_choice_questions, only: %i[edit update show destory]

  def index
  @multiple_choice_questions = MultipleChoiceQuestion.all
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
    @multiple_choice_question.destroy
    redirect_to admin_multiple_choice_questions_path
  end


  private

  def create_multiple_choice_question_params
    params.require(:register_multiple_choice_question_form).permit(
      :multiple_choice_question_body, :correct_choice,
      :incorrect_choice_1, :incorrect_choice_2, :level_part_id)
  end

  def multiple_choice_questions_params
    params.require(:multiple_choice_question).permit(:body).merge(level_part_id: params[:level_part_id])
  end

  def check_multiple_choice_questions
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
  end
end
