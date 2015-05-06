FactoryGirl.define do
  factory :movie, class: Hash do
    title { Faker::Company.name }
    release_date { Faker::Date.backward(60) }
    genre { Faker::Lorem.word }
  end

  factory :invalid_movie, class: Hash do
    title nil
  end
end