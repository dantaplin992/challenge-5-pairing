class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    @tracks << track
  end

  def all
    @tracks
  end
  
  def search(keyword) # keyword is a string
    list = []
    for track in @tracks do
      list << track if track.matches?(keyword) || track.matches?(keyword)
    end
    return list
  end
end

