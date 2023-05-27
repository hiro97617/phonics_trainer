class RegisterMultipleChoiceQuestionForm
  #include Virtus.model
  include ActiveModel::Model
  include ActiveModel::AttributeMethods
  include ActiveModel::Attributes
  include ActiveModel::Validations
  extend CarrierWave::Mount

  attr_accessor :level_part_id
  attribute :multiple_choice_question_body, :string
  attribute :correct_choice, :string
  attribute :incorrect_choice_1, :string
  attribute :incorrect_choice_2, :string
  attribute :image_for_correct_choice, :string
  attribute :image_for_correct_choice_cache, :string
  attribute :image_for_incorrect_choice_1, :string
  attribute :image_for_incorrect_choice_1_cache, :string
  attribute :image_for_incorrect_choice_2, :string
  attribute :image_for_incorrect_choice_2_cache, :string

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
    multiple_choice = multiple_choice_question.multiple_choices.build(body: correct_choice, is_answer: true, image: image_for_correct_choice)
    multiple_choice.save! # 正解選択肢の保存

    first = multiple_choice_question.multiple_choices.build(body: incorrect_choice_1, image: image_for_incorrect_choice_1)
    first.save! # 不正解選択肢の登録
    unless incorrect_choice_2.empty?
      second = multiple_choice_question.multiple_choices.build(body: incorrect_choice_2, image: image_for_incorrect_choice_2)
      second.save! # 不正解選択肢の登録
    end
    true
  end
end