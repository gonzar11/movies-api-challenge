require 'rails_helper'

RSpec.describe ActorsMovie, type: :model do
  it { should belong_to(:person) }
  it { should belong_to(:movie) }
end
