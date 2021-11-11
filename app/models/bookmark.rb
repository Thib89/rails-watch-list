class Bookmark < ApplicationRecord

  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, length: { minimum: 6 }
  # validates_length_of :comment, minimum: 6
  # validates_uniqueness_of :bookmark_id, scope: [:list_id, :movie_id]
  validates_uniqueness_of :list, scope: :movie
  belongs_to :movie
  belongs_to :list
end
