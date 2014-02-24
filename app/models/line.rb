class Line < ActiveRecord::Base
  validates :speech_id, presence: true
  validates :line, presence: true, uniqueness: true

  belongs_to :speech,
    inverse_of: :lines,
    counter_cache: true
  belongs_to :speaker,
    inverse_of: :lines
end