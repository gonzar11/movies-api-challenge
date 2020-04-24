require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:actors_movies).dependent(:destroy) }
  it { should have_many(:producers_movies).dependent(:destroy) }
  it { should have_many(:directors_movies).dependent(:destroy) }
  it { should have_many(:acted_movies).through(:actors_movies) }
  it { should have_many(:produced_movies).through(:producers_movies) }
  it { should have_many(:directed_movies).through(:directors_movies) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end