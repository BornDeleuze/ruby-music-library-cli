

class Song

    attr_accessor :name

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name=name
        if artist == nil 
        else self.artist=(artist)
        end
        if genre == nil
            
        else self.genre=(genre)
        end
        self.save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def save
        @@all <<self
    end

    def self.create(name)
        name = Song.new(name)
    end

    def artist
        @artist
    end

    def artist= (artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre
        @genre
    end
    
    def genre=(genre)
        @genre = genre
    end

    def self.find_by_name(name)
        @@all.find  {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) or self.create(name)
    end

    def self.new_from_filename(filename)
        file_array = filename.split(" - ")
        song_name = file_array[1]
        artist = Artist.find_or_create_by_name(file_array[0])
        genre = Genre.find_or_create_by_name(file_array[2].chomp(".mp3") )
        Song.new(song_name, artist, genre)
      end

      def self.create_from_filename(filename)
        self.new_from_filename(filename).save
      end

end