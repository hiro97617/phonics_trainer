class Lesson < ApplicationRecord
  belongs_to :level_part
  validate :phoneme, presence :true
end
