require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many(:actors_movies).dependent(:destroy) }
  it { should have_many(:producers_movies).dependent(:destroy) }
  it { should have_many(:directors_movies).dependent(:destroy) }
  it { should have_many(:casting).through(:actors_movies) }
  it { should have_many(:producers).through(:producers_movies) }
  it { should have_many(:directors).through(:directors_movies) }

  it { should validate_presence_of(:title) }
end
