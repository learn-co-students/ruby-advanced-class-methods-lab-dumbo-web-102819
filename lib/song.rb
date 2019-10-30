class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #(name)
    song = self.new
    #song.name = name
    @@all << song
    song
  end

  def self.new_by_name (name)
    song = self.new
    song.name = name
    #@@all << song
    song
  end

  def self.create_by_name  (name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name (find_name)
    @@all.find do
      |songs|
      songs.name == find_name
    end
  end

  def self.find_or_create_by_name (find_name)
    found = find_by_name(find_name)
    if !found
      create_by_name (find_name)
    else
    found
    end
  end

  def self.alphabetical
    # name_list = @@all.map do
    #   |songs|
    #   songs.name
    # end

    # sorted = name_list.map do
    #   |names|
    #   find_by_name(names)
    # end
    sorted = self.all.sort_by do
      |songs|
      songs.name
    end
  end

  def self.new_from_filename (file_name)
    #if file_name[-4..-1] == ".mp3"
      # file_name.slice[0..-4]
      file_name.delete_suffix!(".mp3")
      split_name = file_name.split(" - ")
      new_song = create_by_name(split_name[1])
      new_song.artist_name = split_name[0]
      new_song
  end

  def self.create_from_filename (file_name)
    new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = []
  end
end
