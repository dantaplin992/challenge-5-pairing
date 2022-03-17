require 'music_library'

RSpec.describe MusicLibrary do
  context 'we want to view the list of tracks' do
    it 'initializes an empty track list' do
      lib = MusicLibrary.new
      expect(lib.all).to eq []
    end
  end

  context 'we want to add a track to the list' do
    it 'adds the track & returns it in the list' do
      lib = MusicLibrary.new
      track_1 = double(:track, title: "Desire", artist: "Hiromi")
      lib.add(track_1)
      expect(lib.all).to eq [track_1]
    end

    it 'adds and returns multiple tracks' do
      lib = MusicLibrary.new
      track_1 = double(:track, title: "Desire", artist: "Hiromi")
      track_2 = double(:track, title: "Spark", artist: "Hiromi")
      lib.add(track_1)
      lib.add(track_2)
      expect(lib.all).to eq [track_1, track_2]
    end
  end

  context 'we want to search for tracks by keyword' do
    it 'returns all tracks containing a given keyword' do
      lib = MusicLibrary.new
      track_1 = double(:track, title: "All Things Considered", artist: "Simon Phillips", matches?: true)
      track_2 = double(:track, title: "Spark", artist: "Hiromi", matches?: false)
      lib.add(track_1)
      lib.add(track_2)
      expect(lib.search("Things")).to eq [track_1]
    end
  end
end