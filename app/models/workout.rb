class Workout < ApplicationRecord
    belongs_to :user
    has_many :workout_exercises
    has_many :exercises, :through => :workout_exercises

    validates :workout_date, presence: true
    validates :exercise_ids, presence: true

    scope :most_points, -> { order(:points_total)}
end
