# frozen_string_literal: true

require 'pry'

class Artist
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def self.find_or_create_by_name(name)
    all.detect { |artist| artist.name == name } || Artist.new(name)
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end
end
