class Artist

    attr_accessor :name
    attr_reader :songs

    @@all = []
  
    def initialize(name)
        @name = name
        @songs = [ ]
        save
    end
  
    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
    end
  
    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.create(name)
    end
  
    def self.find(name)
        self.all.detect { |artist| artist.name == name }
    end
  
    def self.create(name)
        self.new(name).tap { |artist| artist.save}
    end  

    def save
        @@all << self
    end

    def print_songs
        songs.each { |songs| puts songs.name }
    end

    def songs
        @songs
    end
end