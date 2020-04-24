class Movie < ApplicationRecord
  has_many :actors_movies
  has_many :producers_movies
  has_many :directors_movies

  has_many :casting, through: :actors_movies, source: :person
  has_many :directors, through: :directors_movies, source: :person
  has_many :producers, through: :producers_movies, source: :person

  validates :title, presence: true
end
