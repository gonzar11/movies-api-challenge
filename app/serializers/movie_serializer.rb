class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :release_year
  has_many :casting
  has_many :directors
  has_many :producers

  def release_year
    object.release_year&.to_roman
  end
end
