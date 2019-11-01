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
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.find {|song|
      song.name == name}
  end

  def self.destroy_all
    @@all.clear
  end




end

