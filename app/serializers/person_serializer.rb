class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :aliases
  has_many :acted_movies
  has_many :directed_movies
  has_many :produced_movies
end
