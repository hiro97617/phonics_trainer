class RegisterMultipleChoiceQuestionForm
  #include Virtus.model
  include ActiveModel::Model
  include ActiveModel::AttributeMethods
  include ActiveModel::Attributes
  include ActiveModel::Validations
  extend CarrierWave::Mount

  attr_accessor :level_part_id
  attribute :multiple_choice_question_body, :string
  attribute :choice_1, :string
  attribute :choice_2, :string
  attribute :choice_3, :string
  attribute :image_for_choice_1, :string
  attribute :image_for_choice_1_cache, :string
  attribute :image_for_choice_2, :string
  attribute :image_for_choice_2_cache, :string
  attribute :image_for_choice_3, :string
  attribute :image_for_choice_3_cache, :string
  attribute :is_answer_1, :boolean
  attribute :is_answer_2, :boolean
  attribute :is_answer_3, :boolean

  mount_uploader :image_for_correct_choice, ImageUploader
  mount_uploader :image_for_correct_choice_cache, ImageUploader
  mount_uploader :image_for_incorrect_choice_1, ImageUploader
  mount_uploader :image_for_incorrect_choice_1_cache, ImageUploader
  mount_uploader :image_for_incorrect_choice_2, ImageUploader
  mount_uploader :image_for_incorrect_choice_2_cache, ImageUploader


  validates :multiple_choice_question_body, presence: true, length: { maximum: 140 }
  validates :correct_choice, presence: true, length: { maximum: 40 }
  validates :incorrect_choice_1, presence: true, length: { maximum: 40 }
  validates :incorrect_choice_2, length: { maximum: 40 }
  validates :level_part_id, presence: true

  def save
    return false unless valid?
    multiple_choice_question = MultipleChoiceQuestion.new(body: multiple_choice_question_body, level_part_id: level_part_id)
    multiple_choice_question.save # 問題文の登録
    multiple_choice = multiple_choice_question.multiple_choices.build(body: choice_1, is_answer: is_answer_1, image: image_for_choice_1, image_cache: image_for_choice_1_cache)
    multiple_choice.save! # 正解選択肢の保存

    first = multiple_choice_question.multiple_choices.build(body: choice_2, is_answer: is_answer_2, image: image_for_choice_2, image_cache: image_for_choice_2_cache)
    first.save! # 不正解選択肢の登録
    unless incorrect_choice_2.empty?
      second = multiple_choice_question.multiple_choices.build(body: choice_3, is_answer: is_answer_3, image: image_for_choice_3, image_cache: image_for_choice_3_cache)
      second.save! # 不正解選択肢の登録
    end
    true
  end
end