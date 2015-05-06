FactoryGirl.define do
  factory :review, class: Review do
    email { Faker::Internet.email }
    rating { rand(1..10) }
    created_at { Faker::Date.backward(60) }
  end

  factory :invalid_review, class: Movie do
    email nil
  end
end