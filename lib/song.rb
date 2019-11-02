

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end #all

  def save
    self.class.all << self
  end #save

  def self.create
     song = self.new
     song.save
     song
  end #create

  def self.new_by_name (song_name)
    # Song.new_by_name ("Blank Space")
      song = self.new 
      song.name = song_name 
      song
  end # new_by_name

  def self.create_by_name (song_name)
      song = self.create 
      song.name = song_name 
      song
      
  end #create_by_name
 
  def self.find_by_name (song_name)
       
      self.all.find do |song|

      song.name == song_name 

      # binding.pry

      end #find do

  end #fing_by_name



  def self.find_or_create_by_name (song_name)
      
    
    self.find_by_name(song_name) || self.create_by_name(song_name)
            
      
  end #find create name

  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  #%w{apple pear fig}.sort_by { |word| word.length }
  
  
  end # alpha


  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
    
  end #filename

  def self.create_from_filename (filename)
    array = filename.split(" - ")
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "")


    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  
  end #create filename

  def self.destroy_all
    self.all.clear
  end
end #Song
