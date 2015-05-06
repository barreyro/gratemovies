FactoryGirl.define do
  factory :review do
    email { Faker::Internet.email }
    rating { rand(1..10) }
    created_at { Faker::Date.backward(60) }
  end

  factory :invalid_review, class: Hash do
    email nil
  end
end