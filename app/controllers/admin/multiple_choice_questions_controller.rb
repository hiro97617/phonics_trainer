class Admin::MultipleChoiceQuestionsController < Admin::BaseController
  before_action :check_multiple_choice_question, only: %i[show edit update destroy]
  before_action :set_level_part, only: %i[index new create]

  def top
    @level_parts = LevelPart.all
  end

  def index
    @multiple_choice_questions = @level_part.multiple_choice_questions.includes(:level_part)
  end

  def new
    @register_multiple_choice = RegisterMultipleChoiceQuestionForm.new
  end

  def create
    @register_multiple_choice = RegisterMultipleChoiceQuestionForm.new(multiple_choice_question_params)
    @register_multiple_choice.level_part_id = params[:level_part_id]
    if @register_multiple_choice.save
      redirect_to admin_level_part_multiple_choice_questions_path(@level_part), success: t('defaults.message.created',
                                                                                           item: MultipleChoiceQuestion.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: MultipleChoiceQuestion.model_name.human)
      render :new
    end
  end

  def show; end

  def edit
    @register_multiple_choice = RegisterMultipleChoiceQuestionForm.new(multiple_choice_question:
                                                                       @multiple_choice_question)
  end

  def update
    @register_multiple_choice = RegisterMultipleChoiceQuestionForm.new(multiple_choice_question_params,
                                                                       multiple_choice_question: @multiple_choice_question)
    if @register_multiple_choice.save
      redirect_to admin_multiple_choice_questions_path, success: t('defaults.message.update',
                                                                   item: MultipleChoiceQuestion.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_update', item: MultipleChoiceQuestion.model_name.human)
      render :edit
    end
  end

  def destroy
    @multiple_choice_question.destroy!
    redirect_to admin_multiple_choice_top_path, success: t('defaults.message.deleted',
                                                           item: MultipleChoiceQuestion.model_name.human)
  end

  private

  def set_level_part
    @level_part = LevelPart.find(params[:level_part_id])
  end

  def multiple_choice_question_params
    params.require(:multiple_choice_question).permit(
      :multiple_body, :choice1, :choice2, :choice3, :level_part_id,
      :image_for_choice1, :image_for_choice_1_cache, :image_for_choice2, :image_for_choice_2_cache,
      :image_for_choice3, :image_for_choice_3_cache, :is_answer1, :is_answer2, :is_answer3
    )
  end

  def check_multiple_choice_question
    @multiple_choice_question = MultipleChoiceQuestion.find(params[:id])
  end
end
