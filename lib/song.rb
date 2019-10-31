require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil,artist_name=nil)
    @name = name
    @artist_name = artist_name
  end 
  
  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new(name)
  end
    
  def self.create_by_name(name)
    named_song = new_by_name(name)
    named_song.save
    named_song
  end

  def self.find_by_name(title)
    found_song = self.all.find{|song|
      song.name == title
    }
    found_song
  end

  def self.find_or_create_by_name(name)
    song = !!find_by_name(name) ? find_by_name(name) : create_by_name(name)
    song
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    new_filename = filename.split(/ - |.mp3/)
    song = new_by_name(new_filename.last)
    song.artist_name = new_filename.first
    song
  end 

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
