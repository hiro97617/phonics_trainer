class Lesson < ApplicationRecord
  belongs_to :level_part
  has_many :embeds, dependent: :destroy
  validates :title, presence: true
  mount_uploader :audio, AudioUploader
  mount_uploader :alphabet_name, AlphabetUploader
  mount_uploader :sample_image, SampleCharacterUploader
  enum vibrate: {
    voiceless: 0,
    voiced: 1
  }
end
