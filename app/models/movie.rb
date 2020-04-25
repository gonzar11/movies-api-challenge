class Movie < ApplicationRecord
  has_many :actors_movies, dependent: :destroy
  has_many :producers_movies, dependent: :destroy
  has_many :directors_movies, dependent: :destroy

  has_many :casting, -> { distinct }, through: :actors_movies, source: :person
  has_many :directors, -> { distinct }, through: :directors_movies, source: :person
  has_many :producers, -> { distinct }, through: :producers_movies, source: :person

  validates :title, :release_year, presence: true
  validates_uniqueness_of :title
end
