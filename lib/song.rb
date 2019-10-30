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
  	song = self.new
  	@@all << song
  	song
  end

  def self.new_by_name(name)
  	song = self.new

  	#puts "Song: #{song}, Name: #{song.name.class} Name: #{name}"
  	song.name = name
  	#puts "After: #{song.name}"
  	#@@all << song
  	return song
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	@@all << song
  	return song
  end

  def self.find_by_name(name)
  	@@all.each do |song|
  		if song.name == name
  			return song
  		end
  	end
  	return nil
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name) == nil
  		return create_by_name(name)
  	else
  		return find_by_name(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by do |word|
  		word.name
  	end
  end

  def self.new_from_filename(name)
  	splitResult = name.split(/\.|-/)
  	song = new_by_name(splitResult[1].lstrip)
  	song.artist_name = splitResult[0].strip
  	song
  end

  def self.create_from_filename(name)
  	song = new_from_filename(name)
  	@@all << song
  	return song
  end

  def self.destroy_all
  	@@all = []
  end
end
