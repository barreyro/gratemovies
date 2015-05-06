require 'rails_helper'

describe Movie do
  it "is valid with title, release_date, and genre" do
    movie = Movie.create(
      title: "UFOs",
      release_date: "2015-05-05 03:11:34",
      genre:"Documentary")
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie = Movie.create(title: nil)
    expect(Movie.all).not_to include movie
  end

  it "is invalid without a release date" do
    movie = Movie.create(
      title: "Lego Movie",
      genre: "Comedy")
    expect(Movie.all).not_to include movie
  end

  it "is invalid without a genre" do
    movie = Movie.create(
      title: "Elf",
      release_date: "12-24-04")
    expect(Movie.all).not_to include movie
  end

end
