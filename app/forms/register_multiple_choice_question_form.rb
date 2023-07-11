class RegisterMultipleChoiceQuestionForm
  include ActiveModel::Model
  include ActiveModel::AttributeMethods
  include ActiveModel::Attributes
  include ActiveModel::Validations
  extend CarrierWave::Mount

  attr_accessor :level_part_id

  attribute :multiple_choice_question_body, :string
  attribute :choice1, :string
  attribute :choice2, :string
  attribute :choice3, :string
  attribute :image_for_choice1, :string
  attribute :image_for_choice_1_cache, :string
  attribute :image_for_choice2, :string
  attribute :image_for_choice_2_cache, :string
  attribute :image_for_choice3, :string
  attribute :image_for_choice_3_cache, :string
  attribute :is_answer1, :boolean
  attribute :is_answer2, :boolean
  attribute :is_answer3, :boolean

  mount_uploader :image_for_choice1, ImageUploader
  mount_uploader :image_for_choice_1_cache, ImageUploader
  mount_uploader :image_for_choice2, ImageUploader
  mount_uploader :image_for_choice_2_cache, ImageUploader
  mount_uploader :image_for_choice3, ImageUploader
  mount_uploader :image_for_choice_3_cache, ImageUploader


  validates :multiple_choice_question_body, presence: true, length: { maximum: 140 }
  validates :choice1, presence: true, length: { maximum: 40 }
  validates :choice2, presence: true, length: { maximum: 40 }
  validates :choice3, length: { maximum: 40 }

  def initialize(attributes = nil, multiple_choice_question: MultipleChoiceQuestion.new)
    @multiple_choice_question = multiple_choice_question
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return false unless valid?
    quiz = MultipleChoiceQuestion.new(body: multiple_choice_question_body, level_part_id: level_part_id)
    quiz.save # 問題文の登録
    first = multiple_choice_question.multiple_choices.build(body: choice1, is_answer: is_answer1, image: image_for_choice1, image_cache: image_for_choice_1_cache)
    first.save! # 正解選択肢の保存

    second = multiple_choice_question.multiple_choices.build(body: choice2, is_answer: is_answer2, image: image_for_choice2, image_cache: image_for_choice_2_cache)
    second.save! # 不正解選択肢の登録
    unless choice3.empty?
      third = multiple_choice_question.multiple_choices.build(body: choice3, is_answer: is_answer3, image: image_for_choice3, image_cache: image_for_choice_3_cache)
      third.save! # 不正解選択肢の登録
    end
    true
  end

  def to_model
    multiple_choice_question
  end

  private

  attr_reader :multiple_choice_question

  def default_attributes
    {
      multiple_choice_question_body: multiple_choice_question.body, choice_1: multiple_choice_question.multiple_choices[0]&.body,
      image_for_choice_1: multiple_choice_question.multiple_choices[0].image, is_answer_1: multiple_choice_question.multiple_choices[0].is_answer,
      choice_2: multiple_choice_question.multiple_choices[1].body, image_for_choice_2: multiple_choice_question.multiple_choices[1].image,
      is_answer_2: multiple_choice_question.multiple_choices[1].is_answer, choice_3: multiple_choice_question.multiple_choices[2]&.body,
      image_for_choice_3: multiple_choice_question.multiple_choices[2]&.image, is_answer_3: multiple_choice_question.multiple_choices[2]&.is_answer
    }
  end
end