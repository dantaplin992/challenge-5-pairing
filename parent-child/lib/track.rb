class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    if @title.include?(keyword) || @artist.include?(keyword)
      true
    else
      false
    end
  end
end