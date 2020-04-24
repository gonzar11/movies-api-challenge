require 'rails_helper'

RSpec.describe ProducersMovie, type: :model do
  it { should belong_to(:person) }
  it { should belong_to(:movie) }
end
