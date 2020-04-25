FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.words }
    release_year { Faker::Number.between(from: 1950, to: 2020) }

    transient do
      casting_count { 3 }
    end

    after(:create) do |movie, evaluator|
      evaluator.casting_count.times do
        movie.casting << FactoryBot.create(:person)
      end
    end
  end
end