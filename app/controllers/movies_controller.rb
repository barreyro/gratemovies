class MoviesController < ApplicationController
  def index
      @movies = Movie.all
  end

  def show
  end

  def find_movie(title)
    @movies.each do |check|
      if check.title == title
        movie_path
      else
        new_movie_path
      end
    end
  end
end
