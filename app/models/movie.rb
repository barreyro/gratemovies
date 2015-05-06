class Movie < ActiveRecord::Base
  require 'rest_client'
  validates :title, presence: true
  validates :release_date, presence: true
  validates :genre, presence: true
  has_many :reviews

end