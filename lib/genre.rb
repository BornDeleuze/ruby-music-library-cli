

class Genre

    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name=name
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
        name = Genre.new(name)
    end

    def songs
        Song.all
    end

    def artists
        artist_array = []
        Song.all.each do |song| 
            if artist_array.include? (song.artist)
            else
            artist_array << song.artist
            end
        end
        artist_array
    end

end