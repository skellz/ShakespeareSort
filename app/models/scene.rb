class Scene < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :speeches,
    inverse_of: :scene
  has_many :speakers,
    through: :speeches,
    inverse_of: :scene
end
