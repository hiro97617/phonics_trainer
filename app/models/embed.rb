class Embed < ApplicationRecord
  belongs_to :lesson
  enum media_type:{
    youtube: 0,
    instagram: 1
  }

  def extract_id_from_url
    media_url.last(11) if youtube?
  end
end
