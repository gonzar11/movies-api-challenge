class Movie < ApplicationRecord
  has_many :actors_movies, dependent: :destroy
  has_many :producers_movies, dependent: :destroy
  has_many :directors_movies, dependent: :destroy

  has_many :casting, through: :actors_movies, source: :person
  has_many :directors, through: :directors_movies, source: :person
  has_many :producers, through: :producers_movies, source: :person

  validates :title, presence: true
end
