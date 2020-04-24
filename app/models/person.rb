class Person < ApplicationRecord
  has_many :actors_movies
  has_many :producers_movies
  has_many :directors_movies

  has_many :acted_movies, through: :actors_movies, source: :movie
  has_many :produced_movies, through: :producers_movies, source: :movie
  has_many :directed_movies, through: :directors_movies, source: :movie

  validates :first_name, :last_name, presence: true
end
