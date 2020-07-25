class User < ApplicationRecord
    has_many :workouts
    has_many :exercises, through: :workouts
    has_secure_password

    validates :username, presence: true
    validates :password, presence: true
    validates :username, uniqueness: true
end
