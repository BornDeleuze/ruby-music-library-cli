class Artist

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
        name = Artist.new(name)
    end

    def songs
        Song.all
    end

    def add_song(song)
        if song.artist == nil  
        song.artist = self
        end

        if Song.all.include?(song)    
        else Song.all << song            
        end
    end

    def genres
        genre_array = []
        Song.all.each do |song| 
            if genre_array.include? (song.genre)
            else
            genre_array << song.genre
            end
        end
        genre_array
    end




    # def add_song(song, artist = self)

    # end
    # def songs
    #     Song.all.select {|song| song.artist == self}
    # end

end