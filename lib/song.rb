require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    @@all << song_instance = self.new 
    return song_instance
  end 
  def self.new_by_name(string)
    song_instance = self.new
    song_instance.name = string 
    return song_instance
  end
  def self.create_by_name(string) 
    song_instance = self.new_by_name(string)
    song_instance.save 
    song_instance 
  end 
  def self.find_by_name(string)
      @@all.find do |song_instance|
        song_instance.name == string
      end 
  end 
  def self.find_or_create_by_name(string)
    if self.find_by_name(string)
      self.find_by_name(string)
    else 
      self.create_by_name(string)
    end 
  end 
  def self.alphabetical
    @@all.sort_by { |instance| instance.name }
  end 
  def self.new_from_filename(filename)
    new_instance = self.create
    filename.delete_suffix!('.mp3')
    temp_array = filename.split(" - ")
    new_instance.artist_name = temp_array[0]
    new_instance.name = temp_array[1]
    new_instance
  end 
  def self.create_from_filename(filename)
    song_instance = self.new_from_filename(filename)
    song_instance.save 
    song_instance 
  end 
  def self.destroy_all 
    @@all.clear
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
