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
    params(:multiple_choice_question).
  end


  def check_multiple_choice
    @multiple_choice = MultipleChoice.find(params[:id])
  end
end
end
