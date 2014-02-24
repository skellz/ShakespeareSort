class Speaker < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :speeches,
    inverse_of: :speaker
  has_many :lines,
    through: :speeches
  has_many :scenes,
    -> { uniq },
    through: :speeches

  def longest_speech
    speeches.where('lines_count > ?',0).order(lines_count: :desc).first
  end

  def scene_percent
    total_scenes = Scene.all.count
    scenes_appeared_in = scenes.count
    percent = scenes_appeared_in.to_f/total_scenes.to_f
    percent_per_speaker = (percent * 100).round
  end
end
