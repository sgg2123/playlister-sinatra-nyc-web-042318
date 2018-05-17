require 'pry'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  extend SlugLife::ClassMethods
  include SlugLife::InstanceMethods
end
