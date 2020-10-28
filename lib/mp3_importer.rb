# frozen_string_literal: true

require 'pry'
class MP3Importer
  attr_accessor :path, :name
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if { |song| song == '.' || song == '..' }

    # binding.pry
  end

  def import
    files.each do |song|
      song = Song.new_by_filename(name)
      Artist.all << song unless Artist.all.include?(song)
    end
  end
end
