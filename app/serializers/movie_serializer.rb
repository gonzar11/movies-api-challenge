class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :roman_release_year
  attribute :release_year
  has_many :casting
  has_many :directors
  has_many :producers

  def roman_release_year
    object.release_year&.to_roman
  end
end
