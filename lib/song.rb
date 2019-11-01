require "pry"

class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create 
    class_instance = self.new 
    @@all << class_instance
    # binding.pry
    class_instance 
  end 
  
  def self.new_by_name(name)
      song_instance = self.new
      song_instance.name = name 
      song_instance 
  end
  
  def self.create_by_name(song_name)
    song_instance = self.new_by_name(song_name)
    @@all << song_instance
    song_instance
  end 
  
  def self.find_by_name(name)
      @@all.find do |song_instance| 
      song_instance.name == name
    end 
  end 
  
  def self.find_or_create_by_name(name)
       if self.find_by_name(name)
         self.find_by_name(name)
       else 
         self.create_by_name(name)
       end
  end
  
  def self.alphabetical
    arr = []
    sorted_arr = []
    
    @@all.each do |song_instance| 
      arr << song_instance.name 
    end 
    
    arr.sort.each do |name|
      sorted_arr << self.find_by_name(name)
    end 
    sorted_arr
  end
    # binding.pry 


def self.new_from_filename(name)
  
  artist = name.slice(0...name.index("-") - 1)
  song_name = name.slice(name.index("-") + 2...name.index("."))
      
      song_instance = self.new
      song_instance.name = song_name 
      song_instance.artist_name = artist
      song_instance 
end

def self.create_from_filename(name)
    initialized = self.new_from_filename(name)
    initialized.save
end

 def self.destroy_all
  @@all = []
 end
  
end 
