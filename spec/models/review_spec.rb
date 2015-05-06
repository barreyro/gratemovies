require 'rails_helper'

describe Review do
  it "is valid with email, rating, date, and comment" do
    review = Review.create(
      email: Faker::Internet.email,
      rating: rand(1..10),
      comment: Faker::Lorem.paragraph(2)
      )
    expect(review).to be_valid
  end

  it "is creates a valid timestamp" do
    review = Review.create(
      email: Faker::Internet.email,
      rating: rand(1..10),
      comment: Faker::Lorem.paragraph(2)
      )
    expect(review.created_at).not_to eq nil
  end

  it "is invalid without an email" do
      review = Review.create(
      rating: rand(1..10),
      comment: Faker::Lorem.paragraph(2)
      )
      expect(Review.all).not_to include review
  end

  it "is invalid without a proper email" do
      review = Review.create(
      email: "ABC123",
      rating: rand(1..10),
      comment: Faker::Lorem.paragraph(2)
      )
    expect(Review.all).not_to include review
  end

  it "is invalid without a rating" do
    review = Review.create(
    email: Faker::Internet.email,
    comment: Faker::Lorem.paragraph(2)
    )
    expect(Review.all).not_to include review
  end

  it "is valid without a comment" do
    review = Review.create(
      email: Faker::Internet.email,
      rating: rand(1..10),
      )
    expect(review).to be_valid
  end
end